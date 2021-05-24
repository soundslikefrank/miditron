use dac8564::{Dac as DAC8564, Channel};
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
use micromath::F32Ext;

pub struct Dac4 {
    dac: DAC8564<
        Spi<SPI2, (PB10<Alternate<AF5>>, NoMiso, PC1<Alternate<AF7>>)>,
        PB12<Output<PushPull>>,
        DummyPin<level::Low>,
        DummyPin<level::Low>,
    >,
}

impl Dac4 {
    pub fn new(
        spi_port: SPI2,
        sck_pin: PB10<Input<Floating>>,
        mosi_pin: PC1<Input<Floating>>,
        nss_pin: PB12<Input<Floating>>,
        clocks: Clocks,
    ) -> Dac4 {
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

        let mut dac = DAC8564::new(spi, nss, ldac, enable);
        dac.enable();

        return Self { dac };
    }

    pub fn set_raw(&mut self, channel: Channel, value: u16) -> () {
        // Is there any use in error handling here?
        self.dac.write(channel, value).ok();
    }

    pub fn set_voltage(&mut self, channel: u8, voltage: f32) -> () {
        // TODO: include calibration data somehow
        // Use calibration data in dac initialization (new())
        // x1 = -5
        // x2 = 8
        // y1 = 65535
        // y2 = 0
        // y = (0-65535)/(8+5)*(x+5)+65535
        static V_MAX: f32 = 65535_f32;
        static M: f32 = -V_MAX/13_f32;
        static C: f32 = M * 5_f32 + V_MAX;

        let val = (M * voltage + C).round() as u16;
        self.dac.write(Channel::from_index(channel), val).ok();
    }
}
