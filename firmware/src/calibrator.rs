use core::convert::TryInto;
use heapless::Vec;

use crate::{
    destinations::{colors, CvDestination, LedAction, LedDestination, ModDestination},
    drivers::ButtonState as B,
    utils::math::quad_reg,
};

const DAC4_VOLTAGES: [f32; 14] = [
    -5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0,
];
const DAC8_VOLTAGES: [f32; 11] = [-5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
const MAGIC_CALIBRATION_FLAG: u8 = 42;

pub type Dac4Result = [[f32; 3]; 4];
pub type Dac8Result = [[f32; 3]; 8];

#[derive(Clone, Copy)]
enum Target {
    Start,
    Dac4,
    Dac8,
    End,
}

pub struct CalibrationResult {
    pub dac4: Dac4Result,
    pub dac8: Dac8Result,
}

impl CalibrationResult {
    fn from_points(dac4_points: [[f32; 14]; 4], dac8_points: [[f32; 11]; 8]) -> Self {
        let mut dac4 = [[0.0; 3]; 4];
        let mut dac8 = [[0.0; 3]; 8];
        for (i, chan) in dac4_points.iter().enumerate() {
            dac4[i] = quad_reg(&DAC4_VOLTAGES, chan);
        }
        for (i, chan) in dac8_points.iter().enumerate() {
            dac8[i] = quad_reg(&DAC8_VOLTAGES, chan);
        }
        Self { dac4, dac8 }
    }

    pub fn from_bytes(bytes: &[u8]) -> Self {
        let mut dac4 = [[0.0; 3]; 4];
        let mut dac8 = [[0.0; 3]; 8];

        if bytes[0] == MAGIC_CALIBRATION_FLAG {
            // 0 is the magic byte
            // 3 values * 4 channels * 4 bytes per f32 = 48 bytes
            let dac4_bytes = &bytes[1..49];
            // 3 values * 8 channels * 4 bytes per f32 = 96 bytes
            let dac8_bytes = &bytes[49..145];

            dac4.iter_mut().for_each(|chan| {
                for (dest, src) in chan.iter_mut().zip(dac4_bytes.chunks_exact(4)) {
                    *dest = f32::from_ne_bytes(src.try_into().unwrap());
                }
            });

            dac8.iter_mut().for_each(|chan| {
                for (dest, src) in chan.iter_mut().zip(dac8_bytes.chunks_exact(4)) {
                    *dest = f32::from_ne_bytes(src.try_into().unwrap());
                }
            });
        }

        Self { dac4, dac8 }
    }

    // 4*3*4 + 4*3*8 bytes + 1 magic byte = 145
    pub fn to_bytes(&self) -> Vec<u8, 145> {
        let mut vec: Vec<u8, 145> = Vec::new();
        vec.push(MAGIC_CALIBRATION_FLAG).unwrap();
        vec.extend(
            self.dac4
                .iter()
                .flat_map(|x| x.iter().flat_map(|x| x.to_ne_bytes())),
        );
        vec.extend(
            self.dac8
                .iter()
                .flat_map(|x| x.iter().flat_map(|x| x.to_ne_bytes())),
        );
        vec
    }

    pub fn split(&self) -> (Dac4Result, Dac8Result) {
        (self.dac4, self.dac8)
    }
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
        leds: &mut LedDestination,
    ) -> Option<CalibrationResult> {
        if let Target::Start = self.target {
            self.advance(leds, now);
            self.calibrate(0.0, cvs, mods);
            return None;
        }
        if let Target::End = self.target {
            self.reset();
            return Some(CalibrationResult::from_points(
                self.dac4_data,
                self.dac8_data,
            ));
        }
        match button_states {
            [_, B::Press, B::Press, _] => {
                self.advance(leds, now);
                self.calibrate(0.0, cvs, mods);
            }
            [_, _, _, B::Press] => {
                let (_, big_step) = self.get_step_size();
                self.calibrate(big_step, cvs, mods);
            }
            [B::Press, _, _, _] => {
                let (_, big_step) = self.get_step_size();
                self.calibrate(-big_step, cvs, mods);
            }
            [_, _, B::Press, _] => {
                let (small_step, _) = self.get_step_size();
                self.calibrate(small_step, cvs, mods);
            }
            [_, B::Press, _, _] => {
                let (small_step, _) = self.get_step_size();
                self.calibrate(-small_step, cvs, mods);
            }
            _ => {}
        }
        None
    }

    fn reset(&mut self) {
        self.target = Target::Start;
        self.indices = (0, 0);
    }

    fn get_step_size(&self) -> (f32, f32) {
        match self.target {
            Target::Dac4 => (0.0002, 0.005),
            Target::Dac8 => (0.04, 0.04),
            _ => (0.0, 0.0),
        }
    }

    fn calibrate(&mut self, offset: f32, cvs: &mut CvDestination, mods: &mut ModDestination) {
        let (chan, v) = self.indices;
        match self.target {
            Target::Dac4 => {
                let voltage = DAC4_VOLTAGES[v];
                self.dac4_data[chan][v] += offset;
                cvs.set_raw(chan, voltage + self.dac4_data[chan][v]);
            }
            Target::Dac8 => {
                let voltage = DAC8_VOLTAGES[v];
                self.dac8_data[chan][v] += offset;
                mods.set_raw(chan, voltage + self.dac8_data[chan][v]);
            }
            _ => {}
        }
    }

    fn advance(&mut self, leds: &mut LedDestination, now: u32) {
        let (chan, v) = self.indices;
        match self.target {
            Target::Start => {
                leds.set(LedAction::BlinkOneFast(true, 0, colors::GREEN), now);
                self.target = Target::Dac4;
            }
            Target::Dac4 => {
                if v == 13 {
                    // TODO: this is just for the first channel of Dac4
                    // Remove the following code
                    self.target = Target::Dac8;
                    self.indices = (0, 0);
                    // And uncomment this
                    /* if chan == 3 {
                        self.target = Target::Dac8;
                        self.indices = (0, 0);
                    } else {
                        leds.set(led::Action::BlinkOneFast(true, chan + 1, led::GREEN), now);
                        self.indices = (chan + 1, 0);
                    } */
                } else {
                    self.indices = (chan, v + 1);
                }
            }
            Target::Dac8 => {
                if v == 10 {
                    // TODO: this is just for the first channel of Dac8
                    // Remove the following code
                    self.target = Target::End;
                    leds.set(LedAction::Stop, now);
                    // And uncomment this
                    /* if chan == 7 {
                        self.target = Target::End;
                        leds.set(led::Action::Stop, now);
                    } else {
                        leds.set(
                            led::Action::BlinkOneFast(true, (chan + 1) % 4, led::GREEN),
                            now,
                        );
                        self.indices = (chan + 1, 0);
                    } */
                } else {
                    self.indices = (chan, v + 1);
                }
            }
            _ => {}
        }
    }
}
