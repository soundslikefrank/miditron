use stm32f4xx_hal::{
    gpio::{gpioa::PA5, Output, PushPull},
    prelude::*,
};

type PIN = PA5<Output<PushPull>>;

pub struct Leds {
    // TODO: replace this with the driver for the LP5012
    pin: PIN,
}

impl Leds {
    pub fn new(mut pin: PIN) -> Self {
        pin.set_low().ok();
        Self { pin }
    }

    pub fn set(&mut self) {
        self.pin.set_high().ok();
    }

    pub fn unset(&mut self) {
        self.pin.set_high().ok();
    }

    pub fn toggle(&mut self) {
        self.pin.toggle().ok();
    }
}
