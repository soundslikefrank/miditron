//! Test the serial interface using an interrupt
//!
#![no_main]
#![no_std]
#![deny(unsafe_code)]

#[macro_use(entry, exception)]
extern crate cortex_m_rt as rt;
extern crate cortex_m_semihosting as sh;
extern crate panic_semihosting;

extern crate stm32f4xx_hal as hal;

use cortex_m::{interrupt::free, prelude::*};
use rt::ExceptionFrame;

mod drivers;
mod interrupts;
mod midi;
mod voices;

use drivers::Drivers;
use midi::MidiStream;
use voices::Voices;

#[entry]
fn main() -> ! {
    // -- Begin magic macro block --
    // Leave this at the beginning of main (#[entry]-macro)
    // static mut variables local to the entry point are safe to modify.
    // static mut MIDI_MESSAGE_BUFFER: [u8; MIDI_BUF_LEN] = [0; MIDI_BUF_LEN];
    // -- End magic macro block --

    let mut d = Drivers::setup();

    MidiStream::init();

    loop {
        d.timer.delay_ms(1000_u32);
        d.dac4.set_raw(dac8564::Channel::A, 0);
        d.dac8.set_raw(dac5578::Channel::A, 128);
    }
}

#[allow(non_snake_case)]
#[exception]
fn SysTick() {
    free(|cs| {
        MidiStream::on_message(cs, |m| Voices::process(cs, m));
    })
}

#[allow(non_snake_case)]
#[exception]
fn HardFault(ef: &ExceptionFrame) -> ! {
    panic!("{:#?}", ef);
}
