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

use crate::hal::delay::Delay;
use cortex_m::{interrupt::free, peripheral::syst::SystClkSource};
use dac8564::Dac;
use dummy_pin::DummyPin;
use embedded_hal::spi::{Mode, Phase, Polarity};
use hal::{
    prelude::*,
    spi::Spi,
    time::{Hertz, KiloHertz, MegaHertz},
};
use rt::ExceptionFrame;

mod drivers;
mod interrupts;
mod midi;
mod voices;

use drivers::midi_input::MidiInput;
use midi::{MidiStream, MIDI_BUF_LEN};
use voices::Voices;

const F_CPU: MegaHertz = MegaHertz(80);
const F_SYSTICK: KiloHertz = KiloHertz(8);

/// SPI mode
pub const MODE: Mode = Mode {
    phase: Phase::CaptureOnFirstTransition,
    polarity: Polarity::IdleLow,
};

#[entry]
fn main() -> ! {
    // -- Begin magic macro block --
    // Leave this at the beginning of main (#[entry]-macro)
    // static mut variables local to the entry point are safe to modify.
    static mut MIDI_MESSAGE_BUFFER: [u8; MIDI_BUF_LEN] = [0; MIDI_BUF_LEN];
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

    let sck = gpioa.pa5.into_af5(&mut gpioa.moder, &mut gpioa.afrl);
    let miso = gpioa.pa6.into_af5(&mut gpioa.moder, &mut gpioa.afrl);
    let mosi = gpioa.pa7.into_af5(&mut gpioa.moder, &mut gpioa.afrl);

    let nss = gpioa
        .pa4
        .into_push_pull_output(&mut gpioa.moder, &mut gpioa.otyper);
    let enable = DummyPin::new_low();
    let ldac = DummyPin::new_low();

    let mut spi = Spi::spi1(
        dp.SPI1,
        (sck, miso, mosi),
        MODE,
        1.mhz(),
        clocks,
        &mut rcc.apb2,
    );

    let mut dac = Dac::new(nss, ldac, enable);
    dac.enable();

    let mut timer = Delay::new(syst, clocks);
    loop {
        timer.delay_ms(1000_u32);
        dac.prepare_transfer(dac8564::Channel::A, 65535, |c| {
            spi.write(&c).ok();
        });
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
