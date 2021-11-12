use dac8564::{Channel, Dac as DAC8564};
use dummy_pin::{level, DummyPin};
use embedded_hal::spi::{Mode, Phase, Polarity};
use hal::{gpio, prelude::*, rcc::Clocks, spi::Spi};
use micromath::F32Ext;
use stm32f4xx_hal::{
    gpio::{
        gpioa::{PA4, PA5, PA7},
        Alternate, Floating, Input, NoPin, Output, PushPull, AF5,
    },
    pac::SPI1,
    spi::TransferModeNormal,
};

pub struct Dac4 {
    dac: DAC8564<
        Spi<SPI1, (PA5<Alternate<AF5>>, NoPin, PA7<Alternate<AF5>>), TransferModeNormal>,
        PA4<Output<PushPull>>,
        DummyPin<level::Low>,
        DummyPin<level::Low>,
    >,
}

impl Dac4 {
    pub fn new(
        spi_port: SPI1,
        sck_pin: PA5<Input<Floating>>,
        mosi_pin: PA7<Input<Floating>>,
        nss_pin: PA4<Input<Floating>>,
        clocks: Clocks,
    ) -> Dac4 {
        let sck = sck_pin.into_alternate().set_speed(gpio::Speed::VeryHigh);
        let mosi = mosi_pin.into_alternate().set_speed(gpio::Speed::VeryHigh);

        let nss = nss_pin.into_push_pull_output();
        let enable = DummyPin::new_low();
        let ldac = DummyPin::new_low();

        let spi = Spi::new(
            spi_port,
            (sck, NoPin, mosi),
            Mode {
                polarity: Polarity::IdleLow,
                phase: Phase::CaptureOnSecondTransition,
            },
            1.mhz(),
            clocks,
        );

        let mut dac = DAC8564::new(spi, nss, ldac, enable);
        dac.enable();

        return Self { dac };
    }

    pub fn set_raw(&mut self, channel: Channel, value: u16) {
        // Is there any use in error handling here?
        self.dac.write(channel, value).ok();
    }

    pub fn set_voltage(&mut self, channel: u8, voltage: f32) {
        // x1 = -5.2
        // x2 = 8.4
        // y1 = 65535
        // y2 = 0
        // y = (0-65535)/(8.4+5.2)*(x+5.2)+65535
        static V_MAX: f32 = 65535_f32;
        static M: f32 = -V_MAX / 13.6;
        static C: f32 = M * 5.2 + V_MAX;

        let val = (M * voltage + C).round() as u16;
        self.dac.write(Channel::from_index(channel), val).ok();
    }
}
