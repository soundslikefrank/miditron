use embedded_hal::digital::v2::InputPin;
use stm32f4xx_hal::gpio::{
    gpioc::{PC0, PC1, PC2, PC3},
    Input, PullUp,
};

type PinA = PC0<Input<PullUp>>;
type PinB = PC1<Input<PullUp>>;
type PinC = PC2<Input<PullUp>>;
type PinD = PC3<Input<PullUp>>;

const B_IDLE: [ButtonState; 4] = [ButtonState::Idle; 4];

// TODO: We can encode the entire button state in an AtomicU8
// First four bits are short press, last four bits are long press.
// No more need to put it in resources!
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
    buffer: Option<[ButtonState; 4]>,
    counter: u16,
    debounced: u8,
    press_threshold: u16,
    long_press_threshold: u16,
}

impl PushButtons {
    // In seconds
    // PRESS_THRESHOLD is the window in which simultaneous button presses are recognized
    const PRESS_THRESHOLD: f32 = 0.01;
    const LONG_PRESS_THRESHOLD: f32 = 2.0;

    pub fn new(pin_a: PinA, pin_b: PinB, pin_c: PinC, pin_d: PinD, f_refresh: u16) -> Self {
        Self {
            button_a: Button::new(pin_a),
            button_b: Button::new(pin_b),
            button_c: Button::new(pin_c),
            button_d: Button::new(pin_d),
            buffer: None,
            counter: 0,
            debounced: 0,
            press_threshold: (f_refresh as f32 / (1.0 / Self::PRESS_THRESHOLD)) as u16,
            long_press_threshold: (f_refresh as f32 / (1.0 / Self::LONG_PRESS_THRESHOLD)) as u16,
        }
    }

    pub fn read(&mut self) -> [ButtonState; 4] {
        if let Some(buf) = self.buffer {
            self.buffer = None;
            return buf;
        }
        return B_IDLE;
    }

    pub fn poll(&mut self) {
        let state = (self.button_a.raw_state() << 3)
            | (self.button_b.raw_state() << 2)
            | (self.button_c.raw_state() << 1)
            | self.button_d.raw_state();
        self.debounced |= state;
        // Any button was pressed at least once
        if self.debounced > 0 {
            self.counter = self.counter.wrapping_add(1);
            // Button was let go of
            if state == 0 {
                if self.counter >= self.long_press_threshold {
                    return self.set_pressed(ButtonState::LongPress);
                } else if self.counter >= self.press_threshold {
                    return self.set_pressed(ButtonState::Press);
                }
            }
        }
    }

    fn set_pressed(&mut self, button_state: ButtonState) {
        self.buffer = Some([
            self.from_bits(3, button_state),
            self.from_bits(2, button_state),
            self.from_bits(1, button_state),
            self.from_bits(0, button_state),
        ]);
        self.debounced = 0;
        self.counter = 0;
    }

    fn from_bits(&self, idx: usize, button_state: ButtonState) -> ButtonState {
        if self.debounced >> idx & 1 > 0 {
            button_state
        } else {
            ButtonState::Idle
        }
    }
}

struct Button<PIN> {
    pin: PIN,
}

impl<PIN> Button<PIN>
where
    PIN: InputPin,
{
    pub fn new(pin: PIN) -> Self {
        Self { pin }
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
}
