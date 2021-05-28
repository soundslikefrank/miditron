use cortex_m::peripheral::SYST;
use stm32f4xx_hal::{
    gpio::{gpiob::PB10, gpioc::PC12, AlternateOD, Floating, Input, AF4},
    i2c::I2c,
    pac::I2C2,
    prelude::*,
    rcc::Clocks,
};

pub struct Leds {
    idx: usize,
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
            idx: 0,
            address: 0b0010100,
            i2c,
        }
    }

    pub fn enable(&mut self) {
        self.i2c.write(self.address, &[0x0, 0b01000000]).ok();
        self.i2c.write(self.address, &[0x7, 255, 255, 255, 255]).ok();
        self.toggle();
    }

    pub fn toggle(&mut self) {
        // The F410 has true random value generation
        let tick = SYST::get_current();
        let r = tick as u8;
        let g = (tick >> 8) as u8;
        let b = (tick >> 16) as u8;
        let mut cmd = [0; 13];
        cmd[0] = 0xb;
        cmd[self.idx * 3 + 1] = r;
        cmd[self.idx * 3 + 2] = g;
        cmd[self.idx * 3 + 3] = b;
        if self.idx == 3 {
            self.idx = 0;
        } else {
            self.idx += 1;
        }
        self.i2c.write(self.address, &cmd).ok();
    }
}
