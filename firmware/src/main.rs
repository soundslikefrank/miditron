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

use cortex_m::interrupt::free;

mod dispatcher;
mod drivers;
mod interrupts;
mod midi;

use dispatcher::Dispatcher;
use drivers::Drivers;
use midi::Midi;

#[entry]
fn main() -> ! {
    // -- Begin magic macro block --
    // Leave this at the beginning of main (#[entry]-macro)
    // static mut variables local to the entry point are safe to modify.
    // static mut MIDI_MESSAGE_BUFFER: [u8; MIDI_BUF_LEN] = [0; MIDI_BUF_LEN];
    // -- End magic macro block --

    let mut d = Drivers::setup();

    Midi::init();
    Dispatcher::init();

    loop {
        // FIXME: some check to run this not every loop (but do not use delay)
        // d.timer.delay_ms(1000_u32);
        // TODO: the following should probably go into a function
        let (cvs, gates, mods, leds) = free(Dispatcher::get_commands);

        if let Some(cvs) = cvs {
            cvs.for_each(|(i, &v)| d.dac4.set_voltage(i as u8, v));
        }
        // FIXME: delay the gate a bit
        if let Some(gates) = gates {
            gates.for_each(|(i, &v)| d.gates.set(i, v));
        }
        if let Some(mods) = mods {
            mods.for_each(|(i, &v)| d.dac8.set_voltage(i as u8, v));
        }
        if let Some(leds) = leds {
            leds.for_each(|(i, &v)| d.leds.set(i as u8, v));
        }
    }
}
