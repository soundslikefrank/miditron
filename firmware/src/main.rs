//! Test the serial interface using an interrupt
//!
#![no_main]
#![no_std]
#![deny(unsafe_code)]

#[macro_use(entry, exception)]
extern crate cortex_m_rt as rt;
extern crate cortex_m_semihosting as sh;
extern crate panic_semihosting;

extern crate stm32l4xx_hal as hal;

use cortex_m::peripheral::syst::SystClkSource;
use hal::prelude::*;
use hal::time::{Hertz, KiloHertz, MegaHertz};
use rt::ExceptionFrame;

use core::fmt::Write;
use sh::hio;

mod drivers;
mod interrupts;
mod midi;

use drivers::midi_input::MidiInput;
use midi::MidiStream;

const F_CPU: MegaHertz = MegaHertz(80);
const F_SYSTICK: KiloHertz = KiloHertz(8);

#[entry]
fn main() -> ! {
    // -- Begin magic macro block --
    // Leave this at the beginning of main (#[entry]-macro)
    // static mut variables local to the entry point are safe to modify.
    static mut MIDI_MESSAGE_BUFFER: [u8; 1024] = [0; 1024];
    // -- End magic macro block --

    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = hal::stm32::Peripherals::take().unwrap();

    let mut flash = dp.FLASH.constrain();
    let mut rcc = dp.RCC.constrain();
    let mut pwr = dp.PWR.constrain(&mut rcc.apb1r1);

    let mut gpioa = dp.GPIOA.split(&mut rcc.ahb2);

    let mut syst = cp.SYST;

    let Hertz(f_cpu) = F_CPU.into();
    let Hertz(f_syst) = F_SYSTICK.into();

    let clocks = rcc
        .cfgr
        .sysclk(F_CPU)
        .pclk1(F_CPU)
        .pclk2(F_CPU)
        .freeze(&mut flash.acr, &mut pwr);

    syst.set_clock_source(SystClkSource::Core);
    syst.set_reload(f_cpu / f_syst);
    syst.clear_current();
    syst.enable_counter();
    syst.enable_interrupt();

    MidiInput::init(
        dp.USART1,
        (gpioa.pa9, gpioa.pa10),
        clocks,
        &mut rcc.apb2,
        &mut gpioa.moder,
        &mut gpioa.afrh,
    );

    MidiStream::init(MIDI_MESSAGE_BUFFER);

    loop {}
}

#[allow(non_snake_case)]
#[exception]
fn SysTick() {
    MidiStream::on_message(|m| {
        // voice_manager.process(m);
        if let Ok(mut hstdout) = hio::hstdout() {
            writeln!(hstdout, "{:?}", m).ok();
        }
    });
}

#[allow(non_snake_case)]
#[exception]
fn HardFault(ef: &ExceptionFrame) -> ! {
    panic!("{:#?}", ef);
}
