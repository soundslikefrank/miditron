#![allow(unsafe_code)]

use cortex_m::peripheral::{syst::SystClkSource, SYST};
use hal::{
    prelude::*,
    rcc::{Clocks, Rcc},
    stm32,
};
use stm32f4xx_hal::gpio::{
    gpioa::PA5,
    gpiob::{PB12, PB13, PB14, PB15},
    Output, PushPull,
};

mod dac4;
mod dac8;
mod eeprom;
mod gates;
mod leds;
mod midi_input;
mod push_buttons;

use self::dac8::Dac8;
use self::gates::Gates;
use self::leds::Leds;
use self::{dac4::Dac4, eeprom::Eeprom};

pub use self::midi_input::MidiInput;
pub use self::push_buttons::{ButtonState, PushButtons};

type Drivers = (
    MidiInput,
    PushButtons,
    Dac4,
    Dac8,
    // TODO: this is a bit weird, can we make it better?
    Gates<
        PB12<Output<PushPull>>,
        PB13<Output<PushPull>>,
        PB14<Output<PushPull>>,
        PB15<Output<PushPull>>,
    >,
    Leds,
    Eeprom,
);

pub fn setup(f_cpu: u32, f_systick: u32) -> Drivers {
    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = stm32::Peripherals::take().unwrap();

    let mut syst = cp.SYST;

    let rcc = dp.RCC.constrain();

    let gpioa = dp.GPIOA.split();
    let gpiob = dp.GPIOB.split();
    let gpioc = dp.GPIOC.split();

    let clocks = set_clocks(rcc, f_cpu, f_systick, &mut syst);

    // Initialize UART midi input
    let midi_input = MidiInput::new(dp.USART1, gpioa.pa10, clocks);

    // Initialize push buttons input
    let push_buttons = PushButtons::new(
        gpioc.pc0.into_pull_down_input(),
        gpioc.pc1.into_pull_down_input(),
        gpioc.pc2.into_pull_down_input(),
        gpioc.pc3.into_pull_down_input(),
        f_systick as u16,
    );

    // Initialize DAC8564
    let dac4 = Dac4::new(dp.SPI1, gpioa.pa5, gpioa.pa7, gpioa.pa4, clocks);

    // Initialize DAC5578
    let dac8 = Dac8::new(dp.I2C3, gpioa.pa8, gpioc.pc9, clocks);

    let eeprom = Eeprom::new(dp.I2C1, gpiob.pb6, gpiob.pb7, clocks);

    let gates = Gates::new(
        gpiob.pb12.into_push_pull_output(),
        gpiob.pb13.into_push_pull_output(),
        gpiob.pb14.into_push_pull_output(),
        gpiob.pb15.into_push_pull_output(),
    );

    // Initialize LEDs
    let mut leds = Leds::new(dp.I2C2, gpiob.pb10, gpiob.pb3, clocks);
    leds.reset();
    leds.enable();

    return (midi_input, push_buttons, dac4, dac8, gates, leds, eeprom);
}

fn set_clocks(rcc: Rcc, f_cpu: u32, f_systick: u32, syst: &mut SYST) -> Clocks {
    let clocks = rcc
        .cfgr
        .hclk(f_cpu)
        .sysclk(f_cpu)
        .pclk1(f_cpu / 2)
        .pclk2(f_cpu)
        .freeze();

    syst.set_clock_source(SystClkSource::Core);
    syst.set_reload(f_cpu / f_systick);
    syst.clear_current();
    syst.enable_counter();
    syst.enable_interrupt();

    clocks
}
