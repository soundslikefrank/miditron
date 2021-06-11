use dac5578::{DAC5578, Channel};
use hal::rcc::Clocks;
use hal::{
    gpio::{gpioa::PA8, gpioc::PC9, AlternateOD, Floating, Input, AF4},
    i2c::I2c,
    pac::I2C3,
    prelude::*,
};
use micromath::F32Ext;

pub struct Dac8 {
    dac: DAC5578<I2c<I2C3, (PA8<AlternateOD<AF4>>, PC9<AlternateOD<AF4>>)>>,
}

impl Dac8 {
    pub fn new(
        i2c_port: I2C3,
        scl_pin: PA8<Input<Floating>>,
        sda_pin: PC9<Input<Floating>>,
        clocks: Clocks,
    ) -> Self {
        let scl = scl_pin
            .into_alternate_af4()
            .internal_pull_up(true)
            .set_open_drain();
        let sda = sda_pin
            .into_alternate_af4()
            .internal_pull_up(true)
            .set_open_drain();

        let i2c = I2c::new(i2c_port, (scl, sda), 400.khz().into(), clocks);

        Self {
            dac: DAC5578::new(i2c, dac5578::Address::PinLow),
        }
    }

    pub fn set_raw(&mut self, channel: Channel, value: u8) -> () {
        // Is there any use in error handling here?
        self.dac.write(channel, value).ok();
    }

    pub fn set_voltage(&mut self, channel: u8, voltage: f32) -> () {
        // TODO: include calibration data somehow
        // Use calibration data in dac initialization (new())
        // x1 = -5.2
        // x2 = 5.2
        // y1 = 255
        // y2 = 0
        // y = (0-255)/(5.2+5.2)*(x+5.2)+255
        static V_MAX: f32 = 255_f32;
        static M: f32 = -V_MAX/10.4;
        static C: f32 = M * 5.2 + V_MAX;

        let val = (M * voltage + C).round() as u8;
        self.dac.write(Channel::from(channel), val).ok();
    }
}
