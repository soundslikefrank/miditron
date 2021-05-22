use dac5578::DAC5578;
use hal::rcc::Clocks;
use hal::{
    gpio::{gpioa::PA8, gpioc::PC9, AlternateOD, Floating, Input, AF4},
    i2c::I2c,
    pac::I2C3,
    prelude::*,
};

pub type Dac8Type = DAC5578<I2c<I2C3, (PA8<AlternateOD<AF4>>, PC9<AlternateOD<AF4>>)>>;

pub struct Dac8;

impl Dac8 {
    pub fn init(
        i2c_port: I2C3,
        scl_pin: PA8<Input<Floating>>,
        sda_pin: PC9<Input<Floating>>,
        clocks: Clocks,
    ) -> Dac8Type {
        let scl = scl_pin
            .into_alternate_af4()
            .internal_pull_up(true)
            .set_open_drain();
        let sda = sda_pin
            .into_alternate_af4()
            .internal_pull_up(true)
            .set_open_drain();

        let i2c = I2c::new(i2c_port, (scl, sda), 400.khz().into(), clocks);

        return DAC5578::new(i2c, dac5578::Address::PinLow);
    }
}
