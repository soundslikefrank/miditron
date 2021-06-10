use super::{led, ButtonState as B, CvDestination, LedDispatcher, ModDestination};

#[derive(Clone, Copy)]
enum Target {
    Start,
    Dac4,
    Dac8,
    End,
}

pub struct Calibrator {
    dac4_data: [[f32; 14]; 4],
    dac8_data: [[f32; 11]; 8],
    target: Target,
    indices: (usize, usize),
}

impl Calibrator {
    pub fn new() -> Self {
        Self {
            dac4_data: [[0.0; 14]; 4],
            dac8_data: [[0.0; 11]; 8],
            target: Target::Start,
            indices: (0, 0),
        }
    }
    pub fn process(
        &mut self,
        button_states: [B; 4],
        now: u32,
        cvs: &mut CvDestination,
        mods: &mut ModDestination,
        leds: &mut LedDispatcher,
    ) -> bool {
        match (self.target, button_states) {
            (Target::Start, _) => {
                leds.set(led::Action::Cycle(0, (128, [0, 255, 10])), now);
                self.advance();
                self.calibrate(0.0, cvs, mods);
            }
            (_, [B::Press, B::Press, _, _]) => {
                self.advance();
                self.calibrate(0.0, cvs, mods);
            }
            (_, [_, B::Press, _, _]) => {
                self.calibrate(0.01, cvs, mods);
            }
            (_, [B::Press, _, _, _]) => {
                self.calibrate(-0.01, cvs, mods);
            }
            _ => {}
        }
        false
    }

    fn calibrate(&mut self, offset: f32, cvs: &mut CvDestination, mods: &mut ModDestination) {
        let (chan, v) = self.indices;
        let voltage = v as f32 - 5.0;
        match self.target {
            Target::Dac4 => {
                self.dac4_data[chan][v] += offset;
                cvs.set(chan, voltage + self.dac4_data[chan][v]);
            }
            Target::Dac8 => {
                self.dac8_data[chan][v] += offset;
                mods.set(chan, voltage + self.dac8_data[chan][v]);
            }
            _ => {}
        }
    }

    fn advance(&mut self) {
        let (chan, v) = self.indices;
        match self.target {
            Target::Start => {
                self.target = Target::Dac4;
            }
            Target::Dac4 => {
                if v == 13 {
                    if chan == 3 {
                        self.target = Target::Dac8;
                        self.indices = (0, 0);
                    } else {
                        self.indices = (chan + 1, 0);
                    }
                } else {
                    self.indices = (chan, v + 1);
                }
            }
            Target::Dac8 => {
                if v == 10 {
                    if chan == 7 {
                        self.target = Target::End;
                    } else {
                        self.indices = (chan + 1, 0);
                    }
                } else {
                    self.indices = (chan, v + 1);
                }
            }
            _ => {}
        }
    }
}
