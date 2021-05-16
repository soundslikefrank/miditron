use cortex_m::peripheral::NVIC;
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

        // Enable interrupt
        unsafe {
            NVIC::unmask(interrupt::USART1);
        }
    }
}
