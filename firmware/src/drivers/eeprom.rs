use hal::rcc::Clocks;
use hal::{
    gpio::{gpiob::PB6, gpiob::PB7, AlternateOD, Floating, Input, AF4},
    i2c::I2c,
    pac::I2C1,
    prelude::*,
};
use heapless::Vec;

const ADDRESS: u8 = 0b1010000;

pub struct Eeprom {
    i2c: I2c<I2C1, (PB6<AlternateOD<AF4>>, PB7<AlternateOD<AF4>>)>,
    page_buffer: Vec<u8, 34>,
}

impl Eeprom {
    pub fn new(
        i2c_port: I2C1,
        scl_pin: PB6<Input<Floating>>,
        sda_pin: PB7<Input<Floating>>,
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
            i2c,
            page_buffer: Vec::new(),
        }
    }

    pub fn store_page<const N: usize>(&mut self, page_number: u8, data: &[u8; N]) {
        // A page is 32 bytes, we have 250 pages
        let mem_addr = 32 * page_number as u16;
        let mem_addr = [(mem_addr >> 8) as u8, (mem_addr & 0xff) as u8];
        self.page_buffer.clear();
        // FIXME: do we want to handle errors?
        self.page_buffer.extend_from_slice(&mem_addr).ok();
        self.page_buffer.extend_from_slice(data).ok();
        self.i2c.write(ADDRESS, &self.page_buffer).ok();
    }
}
