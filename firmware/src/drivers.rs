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
mod leds;
mod midi_input;
mod push_buttons;

use self::dac4::Dac4;
use self::dac8::Dac8;
use self::gates::Gates;
use self::leds::Leds;
use self::midi_input::MidiInput;

pub use self::push_buttons::{ButtonState, PushButtons};

const F_CPU: MegaHertz = MegaHertz(84);
const F_SYSTICK: KiloHertz = KiloHertz(8);

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
    // pub timer: Delay,
}

impl Drivers {
    pub fn setup() -> Drivers {
        let Hertz(f_cpu) = F_CPU.into();
        let Hertz(f_systick) = F_SYSTICK.into();

        let cp = cortex_m::Peripherals::take().unwrap();
        let dp = pac::Peripherals::take().unwrap();

        let mut syst = cp.SYST;

        let rcc = dp.RCC.constrain();

        let gpioa = dp.GPIOA.split();
        let gpiob = dp.GPIOB.split();
        let gpioc = dp.GPIOC.split();

        let clocks = Self::set_clocks(rcc, f_cpu, f_systick, &mut syst);

        syst.set_clock_source(SystClkSource::Core);
        // TODO: use const
        syst.set_reload(10500);
        syst.clear_current();
        syst.enable_counter();
        syst.enable_interrupt();

        // Initialize UART midi input
        MidiInput::init(dp.USART1, gpioa.pa10, clocks);

        // Initialize push buttons input
        PushButtons::init(
            gpioc.pc13.into_pull_down_input(),
            gpioc.pc0.into_pull_down_input(),
            gpioc.pc2.into_pull_down_input(),
            gpioc.pc3.into_pull_down_input(),
            // TODO: use const
            8000,
        );

        // Initialize DAC8564
        let dac4 = Dac4::new(dp.SPI2, gpiob.pb10, gpioc.pc1, gpiob.pb12, clocks);

        // Initialize DAC5578
        let dac8 = Dac8::new(dp.I2C3, gpioa.pa8, gpioc.pc9, clocks);

        // Initialize timer
        // TODO: remove, this should be temporary
        // let timer = Delay::new(syst, clocks);

        let gates = Gates::new(
            gpiob.pb15.into_push_pull_output(),
            gpioc.pc6.into_push_pull_output(),
            gpioc.pc7.into_push_pull_output(),
            gpioc.pc8.into_push_pull_output(),
        );

        // Initialize LEDs
        let leds = Leds::new(gpioa.pa5.into_push_pull_output());

        return Drivers {
            dac4,
            dac8,
            gates,
            leds,
            // timer,
        };
    }

    fn set_clocks(rcc: Rcc, f_cpu: u32, f_syst: u32, syst: &mut SYST) -> Clocks {
        return rcc
            .cfgr
            .hclk(84.mhz())
            .sysclk(84.mhz())
            .pclk1(42.mhz())
            .pclk2(84.mhz())
            .freeze();
    }
}
