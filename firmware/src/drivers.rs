#![allow(unsafe_code)]

use cortex_m::peripheral::{syst::SystClkSource, SYST};
use hal::{
    // delay::Delay,
    prelude::*,
    rcc::{Clocks, Rcc},
    stm32,
};
use stm32f4xx_hal::gpio::{
    gpioa::PA5,
    gpiob::PB15,
    gpioc::{PC6, PC7, PC8},
    Output, PushPull,
};

mod dac4;
mod dac8;
mod gates;
mod leds;
mod midi_input;
mod push_buttons;

use self::dac4::Dac4;
use self::dac8::Dac8;
use self::gates::Gates;
use self::leds::Leds;
use self::midi_input::MidiInput;

pub use self::push_buttons::{ButtonState, PushButtons};

pub struct Drivers {
    pub dac4: Dac4,
    pub dac8: Dac8,
    // TODO: this is a bit weird, can we make it better?
    pub gates: Gates<
        PB15<Output<PushPull>>,
        PC6<Output<PushPull>>,
        PC7<Output<PushPull>>,
        PC8<Output<PushPull>>,
    >,
    pub leds: Leds,
    pub ld2: PA5<Output<PushPull>>,
    // pub timer: Delay,
}

impl Drivers {
    pub fn setup(f_cpu: u32, f_systick: u32) -> Drivers {
        let cp = cortex_m::Peripherals::take().unwrap();
        let dp = stm32::Peripherals::take().unwrap();

        let mut syst = cp.SYST;

        let rcc = dp.RCC.constrain();

        let gpioa = dp.GPIOA.split();
        let gpiob = dp.GPIOB.split();
        let gpioc = dp.GPIOC.split();

        let clocks = Self::set_clocks(rcc, f_cpu, f_systick, &mut syst);

        // Initialize UART midi input
        MidiInput::init(dp.USART1, gpioa.pa10, clocks);

        // Initialize push buttons input
        PushButtons::init(
            gpioc.pc13.into_pull_down_input(),
            gpioc.pc0.into_pull_down_input(),
            gpioc.pc2.into_pull_down_input(),
            gpioc.pc3.into_pull_down_input(),
            f_systick as u16,
        );

        // Initialize DAC8564
        let dac4 = Dac4::new(dp.SPI2, gpiob.pb13, gpioc.pc1, gpiob.pb12, clocks);

        // Initialize DAC5578
        let dac8 = Dac8::new(dp.I2C3, gpioa.pa8, gpioc.pc9, clocks);

        // Temp: Initialize timer
        // let timer = Delay::new(syst, clocks);

        let gates = Gates::new(
            gpiob.pb15.into_push_pull_output(),
            gpioc.pc6.into_push_pull_output(),
            gpioc.pc7.into_push_pull_output(),
            gpioc.pc8.into_push_pull_output(),
        );

        // Initialize LEDs
        let mut leds = Leds::new(dp.I2C2, gpiob.pb10, gpioc.pc12, clocks);
        leds.reset();
        leds.enable();

        let ld2 = gpioa.pa5.into_push_pull_output();

        return Drivers {
            dac4,
            dac8,
            gates,
            leds,
            // timer,
            ld2,
        };
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
}
