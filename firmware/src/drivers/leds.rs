use stm32f4xx_hal::{
    gpio::{gpiob::PB10, gpioc::PC12, AlternateOD, Floating, Input, AF4},
    i2c::I2c,
    pac::I2C2,
    prelude::*,
    rcc::Clocks,
};

pub struct Leds {
    address: u8,
    // TODO: replace this with the driver for the LP5012
    i2c: I2c<I2C2, (PB10<AlternateOD<AF4>>, PC12<AlternateOD<AF4>>)>,
}

impl Leds {
    pub fn new(
        i2c_port: I2C2,
        scl_pin: PB10<Input<Floating>>,
        sda_pin: PC12<Input<Floating>>,
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
            address: 0b0010100,
            i2c,
        }
    }

    pub fn enable(&mut self) {
        self.i2c.write(self.address, &[0x0, 0b01000000]).ok();
    }

    pub fn reset(&mut self) {
        self.i2c.write(self.address, &[0x17, 0xff]).ok();
    }

    pub fn set(&mut self, channel: u8, (brightness, [r, g, b]): (u8, [u8; 3])) {
        let bright_addr = 0x7 + channel as u8;
        let color_addr = 0xb + (channel as u8) * 3;
        self.i2c.write(self.address, &[bright_addr, brightness]).ok();
        self.i2c.write(self.address, &[color_addr, r, g, b]).ok();
    }
}
