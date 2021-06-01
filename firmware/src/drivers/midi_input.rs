use cortex_m::peripheral::NVIC;
use embedded_midi::{MidiMessage, MidiParser};
use hal::{
    gpio::{gpioa::PA10, Floating, Input},
    pac::USART1,
    prelude::*,
    rcc::Clocks,
    serial::{config::Config, Event, NoTx, Serial},
    stm32::interrupt,
};
use heapless::spsc::Queue;

/// An informative description of this driver
///
/// Intterrupts: USART1
pub struct MidiInput {
    stream: Queue<u8, 128>,
    parser: MidiParser,
}

impl MidiInput {
    pub fn new(usart: USART1, rx_pin: PA10<Input<Floating>>, clocks: Clocks) -> Self {
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
        Self {
            parser: MidiParser::new(),
            stream: Queue::new(),
        }
    }

    pub fn push(&mut self, val: u8) -> () {
        self.stream.enqueue(val).ok();
    }

    // TODO: not sure if this is good here
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
