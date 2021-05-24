use embedded_hal::digital::v2::OutputPin;

pub struct GatePin<PIN>(PIN);

impl<PIN> GatePin<PIN> where PIN: OutputPin {
    pub fn set(&mut self, state: bool) {
        if state {
            self.0.set_high().ok(); 
        } else {
            self.0.set_low().ok();
        }
    }
}

pub struct Gates<PIN1, PIN2, PIN3, PIN4> {
    pin_a: GatePin<PIN1>,
    pin_b: GatePin<PIN2>,
    pin_c: GatePin<PIN3>,
    pin_d: GatePin<PIN4>,
}

impl<PIN1, PIN2, PIN3, PIN4> Gates<PIN1, PIN2, PIN3, PIN4>
where
    PIN1: OutputPin,
    PIN2: OutputPin,
    PIN3: OutputPin,
    PIN4: OutputPin,
{
    pub fn new(pin_a: PIN1, pin_b: PIN2, pin_c: PIN3, pin_d: PIN4) -> Self {
        Self {
            pin_a: GatePin(pin_a),
            pin_b: GatePin(pin_b),
            pin_c: GatePin(pin_c),
            pin_d: GatePin(pin_d),
        }
    }

    pub fn set(&mut self, channel: usize, state: bool) {
        match channel {
            0 => self.pin_a.set(state),
            1 => self.pin_b.set(state),
            2 => self.pin_c.set(state),
            3 => self.pin_d.set(state),
            _ => panic!("Not a valid gate channel"),
        }
    }
}
