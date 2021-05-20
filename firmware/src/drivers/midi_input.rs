use cortex_m::peripheral::NVIC;
use hal::{
    gpio::{gpioa::PA10, Floating, Input},
    pac::USART1,
    prelude::*,
    rcc::Clocks,
    serial::{config::Config, Event, NoTx, Serial},
    stm32::interrupt,
};

pub struct MidiInput;

impl MidiInput {
    pub fn init(usart: USART1, rx_pin: PA10<Input<Floating>>, clocks: Clocks) {
        let rx = rx_pin.into_alternate_af7();

        if let Ok(mut serial) = Serial::usart1(
            usart,
            (NoTx, rx),
            Config::default().baudrate(31_250.bps()),
            clocks,
        ) {
            // Set the rxneie interrupt bit
            serial.listen(Event::Rxne);

            // Enable interrupt
            unsafe {
                NVIC::unmask(interrupt::USART1);
            }
        }
    }
}
