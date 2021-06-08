use embedded_hal::digital::v2::InputPin;
use heapless::spsc::Queue;
use stm32f4xx_hal::gpio::{
    gpioc::{PC0, PC1, PC2, PC3},
    Input, PullUp,
};

use micromath::F32Ext;

type PinA = PC0<Input<PullUp>>;
type PinB = PC1<Input<PullUp>>;
type PinC = PC2<Input<PullUp>>;
type PinD = PC3<Input<PullUp>>;

#[derive(Copy, Clone)]
pub enum ButtonState {
    Press,
    LongPress,
    Idle,
}

pub struct PushButtons {
    button_a: Button<PinA>,
    button_b: Button<PinB>,
    button_c: Button<PinC>,
    button_d: Button<PinD>,
    state: Queue<[ButtonState; 4], 2>,
}

impl PushButtons {
    // In seconds
    const LONG_PRESS_THRESHOLD: u8 = 2;

    pub fn new(pin_a: PinA, pin_b: PinB, pin_c: PinC, pin_d: PinD, f_refresh: u16) -> Self {
        // threshold = x (s) / (sample_size * f_refresh (Hz))
        let long_press_threshold =
            (Self::LONG_PRESS_THRESHOLD as f32 / (8.0 / f_refresh as f32)).round() as u16;
        Self {
            button_a: Button::new(pin_a, long_press_threshold),
            button_b: Button::new(pin_b, long_press_threshold),
            button_c: Button::new(pin_c, long_press_threshold),
            button_d: Button::new(pin_d, long_press_threshold),
            state: Queue::new(),
        }
    }

    pub fn read(&mut self) -> [ButtonState; 4] {
        self.state.dequeue().unwrap_or([ButtonState::Idle; 4])
    }

    pub fn poll(&mut self) -> () {
        self.state
            .enqueue([
                self.button_a.poll(),
                self.button_b.poll(),
                self.button_c.poll(),
                self.button_d.poll(),
            ])
            .ok();
    }
}

pub struct Button<PIN> {
    pin: PIN,
    pub sample_idx: u8,
    pub samples: u8,
    pub long_press_counter: u16,
    pub long_press_threshold: u16,
}

impl<PIN> Button<PIN>
where
    PIN: InputPin,
{
    pub fn new(pin: PIN, long_press_threshold: u16) -> Self {
        Self {
            pin,
            sample_idx: 0,
            samples: 0,
            long_press_counter: 0,
            long_press_threshold,
        }
    }

    fn raw_state(&self) -> u8 {
        // If pressed, button is pulled to ground
        if let Ok(low) = self.pin.is_low() {
            if low {
                return 1;
            } else {
                return 0;
            }
        }
        0
    }

    pub fn poll(&mut self) -> ButtonState {
        // Read one byte of samples
        if self.sample_idx == 7 {
            self.sample_idx = 0;
            if self.samples > 0 {
                // The button was pressed, increment long press counter
                if self.long_press_counter < u16::MAX {
                    self.long_press_counter += 1;
                }
            } else if self.long_press_counter > 0 {
                // Button was let go of but long press counter had been started
                if self.long_press_counter > self.long_press_threshold {
                    // It's a long press!
                    self.long_press_counter = 0;
                    return ButtonState::LongPress;
                }
                // Long press counter started but we don't have presses anymore. It's a short press
                self.long_press_counter = 0;
                return ButtonState::Press;
            }
            self.samples = 0;
        }
        // Collect samples and prevent overflow
        self.samples |= self.raw_state() << self.sample_idx;
        self.sample_idx += 1;
        ButtonState::Idle
    }
}
