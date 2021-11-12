use cortex_m::peripheral::NVIC;
use embedded_midi::{MidiMessage, MidiParser};
use hal::{
    gpio::{gpioa::PA10, Floating, Input},
    pac::USART1,
    prelude::*,
    rcc::Clocks,
    serial::{config::Config, Serial},
    stm32::interrupt,
};
use heapless::spsc::Queue;
use stm32f4xx_hal::serial::Rx;

pub struct MidiInput {
    stream: Queue<u8, 128>,
    parser: MidiParser,
}

impl MidiInput {
    pub fn new(usart: USART1, rx_pin: PA10<Input<Floating>>, clocks: Clocks) -> Self {
        let mut rx: Rx<USART1, u8> = Serial::rx(
            usart,
            rx_pin.into_alternate(),
            Config::default().baudrate(31_250.bps()),
            clocks,
        )
        .unwrap();

        // Set the rxneie interrupt bit
        rx.listen();

        // Enable interrupt
        unsafe {
            NVIC::unmask(interrupt::USART1);
        }

        Self {
            parser: MidiParser::new(),
            stream: Queue::new(),
        }
    }

    pub fn push(&mut self, val: u8) {
        self.stream.enqueue(val).ok();
    }

    pub fn read(&mut self) -> Option<MidiMessage> {
        if self.stream.is_empty() {
            return None;
        }
        if self.stream.is_full() {
            // This should really not happen, let's panic
            panic!("Queue is full");
        }
        while let Some(byte) = self.stream.dequeue() {
            if let Some(msg) = self.parser.parse_byte(byte) {
                return Some(msg);
            }
        }
        None
    }
}
