use embedded_hal::digital::v2::OutputPin;
use stm32f4xx_hal::gpio::{
    gpiob::{PB0, PB1, PB12, PB13, PB14, PB15},
    gpioc::{PC4, PC5},
    Floating, Input, Output, PushPull,
};

// TODO: make these global somehow?
type IF = Input<Floating>;
type OPP = Output<PushPull>;

pub struct DOutPin<PIN>(PIN);

impl<PIN> DOutPin<PIN>
where
    PIN: OutputPin,
{
    pub fn set(&mut self, state: bool) {
        if state {
            self.0.set_high().ok();
        } else {
            self.0.set_low().ok();
        }
    }
}

pub struct DigitalOuts {
    ch_a: DOutPin<PB12<OPP>>,
    ch_b: DOutPin<PB13<OPP>>,
    ch_c: DOutPin<PB14<OPP>>,
    ch_d: DOutPin<PB15<OPP>>,
    clock: DOutPin<PC4<OPP>>,
    run: DOutPin<PC5<OPP>>,
    ping: DOutPin<PB0<OPP>>,
    pong: DOutPin<PB1<OPP>>,
}

impl DigitalOuts {
    pub fn new(
        pin_a: PB12<IF>,
        pin_b: PB13<IF>,
        pin_c: PB14<IF>,
        pin_d: PB15<IF>,
        pin_clock: PC4<IF>,
        pin_run: PC5<IF>,
        pin_ping: PB0<IF>,
        pin_pong: PB1<IF>,
    ) -> Self {
        Self {
            ch_a: DOutPin(pin_a.into_push_pull_output()),
            ch_b: DOutPin(pin_b.into_push_pull_output()),
            ch_c: DOutPin(pin_c.into_push_pull_output()),
            ch_d: DOutPin(pin_d.into_push_pull_output()),
            clock: DOutPin(pin_clock.into_push_pull_output()),
            run: DOutPin(pin_run.into_push_pull_output()),
            ping: DOutPin(pin_ping.into_push_pull_output()),
            pong: DOutPin(pin_pong.into_push_pull_output()),
        }
    }

    pub fn set(&mut self, channel: usize, state: bool) {
        match channel {
            // FIXME: use enum for channel number match
            0 => self.ch_a.set(state),
            1 => self.ch_b.set(state),
            2 => self.ch_c.set(state),
            3 => self.ch_d.set(state),
            4 => self.clock.set(state),
            5 => self.run.set(state),
            6 => self.ping.set(state),
            7 => self.pong.set(state),
            _ => panic!("Not a valid digital output"),
        }
    }
}
