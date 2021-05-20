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

use crate::hal::delay::Delay;
use cortex_m::{interrupt::free, peripheral::syst::SystClkSource};
use dac5578::DAC5578;
use dac8564::Dac as DAC8564;
use dummy_pin::DummyPin;
use embedded_hal::spi::{Mode, Phase, Polarity};
use hal::{
    gpio,
    i2c::I2c,
    prelude::*,
    spi::{NoMiso, Spi},
    time::{Hertz, KiloHertz, MegaHertz},
};
use rt::ExceptionFrame;

mod drivers;
mod interrupts;
mod midi;
mod voices;

use drivers::midi_input::MidiInput;
use midi::MidiStream;
use voices::Voices;

const F_CPU: MegaHertz = MegaHertz(80);
const F_SYSTICK: KiloHertz = KiloHertz(8);

#[entry]
fn main() -> ! {
    // -- Begin magic macro block --
    // Leave this at the beginning of main (#[entry]-macro)
    // static mut variables local to the entry point are safe to modify.
    // static mut MIDI_MESSAGE_BUFFER: [u8; MIDI_BUF_LEN] = [0; MIDI_BUF_LEN];
    // -- End magic macro block --

    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = hal::pac::Peripherals::take().unwrap();

    // let mut flash = dp.FLASH.constrain();
    let rcc = dp.RCC.constrain();
    // let mut pwr = dp.PWR.constrain(&mut rcc.apb1r1);

    let gpioa = dp.GPIOA.split();
    let gpiob = dp.GPIOB.split();
    let gpioc = dp.GPIOC.split();

    let mut syst = cp.SYST;

    let Hertz(f_cpu) = F_CPU.into();
    let Hertz(f_syst) = F_SYSTICK.into();

    let clocks = rcc
        .cfgr
        .hclk(84.mhz())
        .sysclk(84.mhz())
        .pclk1(42.mhz())
        .pclk2(84.mhz())
        .freeze();

    syst.set_clock_source(SystClkSource::Core);
    syst.set_reload(f_cpu / f_syst);
    syst.clear_current();
    syst.enable_counter();
    syst.enable_interrupt();

    MidiInput::init(dp.USART1, gpioa.pa10, clocks);

    MidiStream::init();

    let sck = gpiob
        .pb10
        .into_alternate_af5()
        .set_speed(gpio::Speed::VeryHigh);
    let mosi = gpioc
        .pc1
        .into_alternate_af7()
        .set_speed(gpio::Speed::VeryHigh);

    let nss = gpiob.pb12.into_push_pull_output();
    let enable = DummyPin::new_low();
    let ldac = DummyPin::new_low();

    let spi = Spi::spi2(
        dp.SPI2,
        (sck, NoMiso, mosi),
        Mode {
            polarity: Polarity::IdleLow,
            phase: Phase::CaptureOnSecondTransition,
        },
        1.mhz().into(),
        clocks,
    );

    let mut dac4 = DAC8564::new(spi, nss, ldac, enable);
    dac4.enable();

    let scl = gpioa
        .pa8
        .into_alternate_af4()
        .internal_pull_up(true)
        .set_open_drain();
    let sda = gpioc
        .pc9
        .into_alternate_af4()
        .internal_pull_up(true)
        .set_open_drain();

    let i2c = I2c::new(dp.I2C3, (scl, sda), 400.khz().into(), clocks);

    let mut dac8 = DAC5578::new(i2c, dac5578::Address::PinLow);

    let mut timer = Delay::new(syst, clocks);

    loop {
        timer.delay_ms(1000_u32);
        if let Ok(_) = dac4.write(dac8564::Channel::A, 32767) {
            // what now?
        }
        if let Ok(_) = dac8.write(dac5578::Channel::A, 255) {
            // party?
        }
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
