#![allow(unsafe_code)]

use cortex_m::peripheral::{syst::SystClkSource, SYST};
use hal::{
    prelude::*,
    rcc::{Clocks, Rcc},
    stm32,
};

mod dac4;
mod dac8;
mod digital_outs;
mod eeprom;
mod leds;
mod midi_input;
mod push_buttons;

use self::dac8::Dac8;
use self::digital_outs::DigitalOuts;
use self::leds::Leds;
use self::{dac4::Dac4, eeprom::Eeprom};

pub use self::midi_input::MidiInput;
pub use self::push_buttons::{ButtonState, PushButtons};

type Drivers = (
    MidiInput,
    PushButtons,
    Dac4,
    Dac8,
    DigitalOuts,
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

    // TODO: this is temporary, it kind of seems to work as an initial delay
    // Wait a bit for the peripherals to settle in
    let mut delay = hal::delay::Delay::tim5(dp.TIM5, &clocks);
    delay.delay_ms(500_u32);

    // Initialize UART midi input
    let midi_input = MidiInput::new(dp.USART1, gpioa.pa10, clocks);

    // Initialize push buttons input
    // FIXME: use same technique as for digital_outs!
    let push_buttons = PushButtons::new(
        gpioc.pc0.into_pull_up_input(),
        gpioc.pc2.into_pull_up_input(),
        gpioc.pc1.into_pull_up_input(),
        gpioc.pc3.into_pull_up_input(),
        f_systick as u16,
    );

    // Initialize DAC8564
    let dac4 = Dac4::new(dp.SPI1, gpioa.pa5, gpioa.pa7, gpioa.pa4, clocks);

    // Initialize DAC5578
    let dac8 = Dac8::new(dp.I2C3, gpioa.pa8, gpioc.pc9, clocks);

    let eeprom = Eeprom::new(dp.I2C1, gpiob.pb6, gpiob.pb7, clocks);

    let digital_outs = DigitalOuts::new(
        gpiob.pb12, gpiob.pb13, gpiob.pb14, gpiob.pb15, gpioc.pc4, gpioc.pc5, gpiob.pb0, gpiob.pb1,
    );

    // Initialize LEDs
    let mut leds = Leds::new(dp.I2C2, gpiob.pb10, gpiob.pb3, clocks);
    leds.reset();
    leds.enable();

    // Play some initialization sequence (also functions as a delay)
    leds.set(0, (50, [255, 255, 255]));
    delay.delay_ms(500_u32);
    for _ in 0..4 {
        for led in 0..4 {
            leds.set(led, (50, [255, 255, 255]));
            delay.delay_ms(100_u32);
            leds.set(led, (0, [0; 3]));
        }
    }

    (
        midi_input,
        push_buttons,
        dac4,
        dac8,
        digital_outs,
        leds,
        eeprom,
    )
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
