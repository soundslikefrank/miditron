use core::cell::{RefCell, RefMut};
use cortex_m::{
    interrupt::{free, Mutex},
    peripheral::NVIC,
};
use hal::{
    device::USART1,
    gpio::{
        gpioa::{AFRH, MODER},
        Floating, Input, PA10, PA9,
    },
    prelude::*,
    rcc::{Clocks, APB2},
    serial::{Config, Event, Serial},
    stm32::interrupt,
};
use heapless::spsc::Queue;

pub static MIDI_STREAM: Mutex<RefCell<Queue<u8, 128>>> = Mutex::new(RefCell::new(Queue::new()));
pub struct MidiInput;

impl MidiInput {
    pub fn init(
        usart: USART1,
        (pin_tx, pin_rx): (PA9<Input<Floating>>, PA10<Input<Floating>>),
        clocks: Clocks,
        apb: &mut APB2,
        moder: &mut MODER,
        afrh: &mut AFRH,
    ) -> () {
        let tx = pin_tx.into_af7(moder, afrh);
        let rx = pin_rx.into_af7(moder, afrh);

        let mut serial = Serial::usart1(
            usart,
            (tx, rx),
            Config::default().baudrate(31_250.bps()),
            clocks,
            apb,
        );

        // Set the rxneie interrupt bit
        serial.listen(Event::Rxne);

        unsafe {
            NVIC::unmask(interrupt::USART1);
        }
    }

    pub fn stream<F>(f: F) -> ()
    where
        F: FnOnce(&mut RefMut<Queue<u8, 128>>) -> (),
    {
        free(|cs| {
            let mut queue = MIDI_STREAM.borrow(cs).borrow_mut();
            f(&mut queue);
        })
    }
}
