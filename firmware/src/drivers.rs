#![allow(unsafe_code)]

use cortex_m::peripheral::{syst::SystClkSource, SYST};
use hal::{
    delay::Delay,
    pac,
    prelude::*,
    rcc::{Clocks, Rcc},
    time::{Hertz, KiloHertz, MegaHertz},
};
use stm32f4xx_hal::gpio::{
    gpiob::PB15,
    gpioc::{PC6, PC7, PC8},
    Output, PushPull,
};

mod dac4;
mod dac8;
mod gates;
mod midi_input;

use self::dac4::Dac4;
use self::dac8::Dac8;
use self::gates::Gates;
use self::midi_input::MidiInput;

const F_CPU: MegaHertz = MegaHertz(84);
const F_SYSTICK: KiloHertz = KiloHertz(8);

pub struct Drivers {
    pub dac4: Dac4,
    pub dac8: Dac8,
    pub gates: Gates<
        PB15<Output<PushPull>>,
        PC6<Output<PushPull>>,
        PC7<Output<PushPull>>,
        PC8<Output<PushPull>>,
    >,
    pub timer: Delay,
}

impl Drivers {
    pub fn setup() -> Drivers {
        let cp = cortex_m::Peripherals::take().unwrap();
        let dp = pac::Peripherals::take().unwrap();

        let mut syst = cp.SYST;

        let rcc = dp.RCC.constrain();

        let gpioa = dp.GPIOA.split();
        let gpiob = dp.GPIOB.split();
        let gpioc = dp.GPIOC.split();

        let clocks = Self::set_clocks(rcc, &mut syst);

        // Initialize UART midi input
        MidiInput::init(dp.USART1, gpioa.pa10, clocks);

        // Initialize DAC8564
        let dac4 = Dac4::new(dp.SPI2, gpiob.pb10, gpioc.pc1, gpiob.pb12, clocks);

        // Initialize DAC5578
        let dac8 = Dac8::new(dp.I2C3, gpioa.pa8, gpioc.pc9, clocks);

        // Initialize timer
        // TODO: remove, this should be temporary
        let timer = Delay::new(syst, clocks);

        let mut led = gpioa.pa5.into_push_pull_output();
        led.set_high().unwrap();

        let gates = Gates::new(
            gpiob.pb15.into_push_pull_output(),
            gpioc.pc6.into_push_pull_output(),
            gpioc.pc7.into_push_pull_output(),
            gpioc.pc8.into_push_pull_output(),
        );

        return Drivers {
            dac4,
            dac8,
            gates,
            timer,
        };
    }

    fn set_clocks(rcc: Rcc, syst: &mut SYST) -> Clocks {
        let Hertz(f_cpu) = F_CPU.into();
        let Hertz(f_syst) = F_SYSTICK.into();

        syst.set_clock_source(SystClkSource::Core);
        syst.set_reload(f_cpu / f_syst);
        syst.clear_current();
        syst.enable_counter();
        syst.enable_interrupt();

        return rcc
            .cfgr
            .hclk(F_CPU)
            .sysclk(F_CPU)
            .pclk1(f_cpu / 2)
            .pclk2(F_CPU)
            .freeze();
    }
}
