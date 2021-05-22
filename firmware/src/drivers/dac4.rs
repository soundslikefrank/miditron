use dac8564::Dac as DAC8564;
use dummy_pin::{level, DummyPin};
use embedded_hal::spi::{Mode, Phase, Polarity};
use hal::{
    gpio,
    prelude::*,
    rcc::Clocks,
    spi::{NoMiso, Spi},
};
use stm32f4xx_hal::{
    gpio::{
        gpiob::{PB10, PB12},
        gpioc::PC1,
        Alternate, Floating, Input, Output, PushPull, AF5, AF7,
    },
    pac::SPI2,
};

pub type Dac4Type = DAC8564<
    Spi<SPI2, (PB10<Alternate<AF5>>, NoMiso, PC1<Alternate<AF7>>)>,
    PB12<Output<PushPull>>,
    DummyPin<level::Low>,
    DummyPin<level::Low>,
>;

pub struct Dac4;

impl Dac4 {
    pub fn init(
        spi_port: SPI2,
        sck_pin: PB10<Input<Floating>>,
        mosi_pin: PC1<Input<Floating>>,
        nss_pin: PB12<Input<Floating>>,
        clocks: Clocks,
    ) -> Dac4Type {
        let sck = sck_pin
            .into_alternate_af5()
            .set_speed(gpio::Speed::VeryHigh);
        let mosi = mosi_pin
            .into_alternate_af7()
            .set_speed(gpio::Speed::VeryHigh);

        let nss = nss_pin.into_push_pull_output();
        let enable = DummyPin::new_low();
        let ldac = DummyPin::new_low();

        let spi = Spi::spi2(
            spi_port,
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

        return dac4;
    }
}
