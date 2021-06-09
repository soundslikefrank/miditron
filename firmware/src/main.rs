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
use dispatcher::Dispatcher;
use hal::time::{Hertz, KiloHertz, MegaHertz};

mod arp;
mod clock;
mod dispatcher;
mod drivers;
mod interrupts;
mod layout;
mod resources;
mod utils;

use resources::Resources;

const F_CPU: MegaHertz = MegaHertz(84);
const F_SYSTICK: KiloHertz = KiloHertz(8);

#[entry]
fn main() -> ! {
    // -- Begin magic macro block --
    // Leave this at the beginning of main (#[entry]-macro)
    // static mut variables local to the entry point are safe to modify.
    // static mut MIDI_MESSAGE_BUFFER: [u8; MIDI_BUF_LEN] = [0; MIDI_BUF_LEN];
    // -- End magic macro block --
    //
    let Hertz(f_cpu) = F_CPU.into();
    let Hertz(f_systick) = F_SYSTICK.into();

    let (
        d_midi_input,
        d_push_buttons,
        mut d_dac4,
        mut d_dac8,
        mut d_gates,
        mut d_leds,
        mut _eeprom,
    ) = drivers::setup(f_cpu, f_systick);

    let mut dispatcher = Dispatcher::new(f_systick);

    free(|cs| Resources::init(cs, d_push_buttons, d_midi_input));

    let mut c = 0;

    loop {
        if c == 0 {
            // _eeprom.store_page(0, &[6, 6, 6]);
            c = 1;
        }

        if c == 1 {
            let x = _eeprom.read_page(0);
            c = 2;
        }

        let inputs = free(|cs| {
            if let Some(res) = Resources::borrow(cs).as_mut() {
                let button_states = res.push_buttons.read();
                let midi_msg = res.midi_input.read();
                let now = res.clock.get();
                // TODO: add arp output
                return Some((button_states, midi_msg, now));
            }
            None
        });

        let (cvs, gates, mods, leds) = dispatcher.process(inputs);

        if let Some(cvs) = cvs {
            cvs.for_each(|(i, &v)| d_dac4.set_voltage(i as u8, v));
        }
        // FIXME: delay the gate a bit
        if let Some(gates) = gates {
            gates.for_each(|(i, &v)| d_gates.set(i, v));
        }
        if let Some(mods) = mods {
            mods.for_each(|(i, &v)| d_dac8.set_voltage(i as u8, v));
        }
        if let Some(leds) = leds {
            leds.for_each(|(i, &v)| d_leds.set(i as u8, v));
        }
    }
}
