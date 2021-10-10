use stm32f4xx_hal::{
    gpio::{
        gpiob::{PB10, PB3},
        AlternateOD, Floating, Input, AF4, AF9,
    },
    i2c::I2c,
    pac::I2C2,
    prelude::*,
    rcc::Clocks,
};

pub struct Leds {
    address: u8,
    // TODO: replace this with the driver for the LP5012
    i2c: I2c<I2C2, (PB10<AlternateOD<AF4>>, PB3<AlternateOD<AF9>>)>,
}

impl Leds {
    pub fn new(
        i2c_port: I2C2,
        scl_pin: PB10<Input<Floating>>,
        sda_pin: PB3<Input<Floating>>,
        clocks: Clocks,
    ) -> Self {
        let scl = scl_pin
            .into_alternate_af4()
            .internal_pull_up(true)
            .set_open_drain();
        let sda = sda_pin
            .into_alternate_af9()
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

    pub fn set(&mut self, mut channel: u8, (brightness, [r, g, b]): (u8, [u8; 3])) {
        // TODO: on the first version of the PCB the center LEDs are swapped
        if channel == 1 {
            channel = 2;
        } else if channel == 2 {
            channel = 1;
        }
        let bright_addr = 0x7 + channel;
        let color_addr = 0xb + channel * 3;
        self.i2c
            .write(self.address, &[bright_addr, brightness])
            .ok();
        self.i2c.write(self.address, &[color_addr, r, g, b]).ok();
    }
}
