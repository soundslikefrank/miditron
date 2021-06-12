use core::{array::IntoIter, convert::TryInto};
use heapless::Vec;

use super::{led, ButtonState as B, CvDestination, LedDispatcher, ModDestination};
use crate::utils::math::quad_reg;

const DAC4_VOLTAGES: [f32; 14] = [
    -5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0,
];
const DAC8_VOLTAGES: [f32; 11] = [-5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
const MAGIC_CALIBRATION_FLAG: u8 = 42;

#[derive(Clone, Copy)]
enum Target {
    Start,
    Dac4,
    Dac8,
    End,
}

pub struct CalibrationResult {
    // TODO: Replace `1`s with 4 and 8 respectively
    pub dac4: [[f32; 3]; 1],
    pub dac8: [[f32; 3]; 1],
}

impl CalibrationResult {
    // TODO: Replace `1`s with 4 and 8 respectively
    fn from_points(dac4_points: [[f32; 14]; 1], dac8_points: [[f32; 11]; 1]) -> Self {
        let mut dac4 = [[0.0; 3]; 1];
        let mut dac8 = [[0.0; 3]; 1];
        for (i, chan) in dac4_points.iter().enumerate() {
            dac4[i] = quad_reg(&DAC4_VOLTAGES, chan);
        }
        for (i, chan) in dac8_points.iter().enumerate() {
            dac8[i] = quad_reg(&DAC8_VOLTAGES, chan);
        }
        Self { dac4, dac8 }
    }

    pub fn from_bytes(bytes: &[u8]) -> Self {
        // TODO: Acually 4*3*4 + 4*3*8 bytes + 1 byte (write flag) = 145
        if bytes.len() != 25 {
            // Slice needs to be 25/145 bytes long!!!
            panic!("Should be a 25 bytes slice");
        }
        let mut dac4 = [[0.0; 3]; 1];
        let mut dac8 = [[0.0; 3]; 1];

        if bytes[0] == MAGIC_CALIBRATION_FLAG {
            let dac4_bytes = &bytes[1..13];
            let dac8_bytes = &bytes[13..25];

            // TODO: we would loop through all the channels here
            for (dest, src) in dac4[0].iter_mut().zip(dac4_bytes.chunks_exact(4)) {
                *dest = f32::from_ne_bytes(src.try_into().unwrap());
            }

            for (dest, src) in dac8[0].iter_mut().zip(dac8_bytes.chunks_exact(4)) {
                *dest = f32::from_ne_bytes(src.try_into().unwrap());
            }
        }

        Self { dac4, dac8 }
    }

    // TODO: Acually 4*3*4 + 4*3*8 bytes + 1 magic byte = 145
    // For now 3 (values per channel) * 4 (u8 bytes per f32) * 2 (dac4 and dac8) + magic byte = 25
    /*
     * In next stable release (no IntoIter necessary)
     * let f_vec: [f32; 2] = [0.55, 2.33];
     * let u8_vec = f_vec.iter().flat_map(|x| x.to_le_bytes()).collect::<Vec<u8>>();
     */
    pub fn to_bytes(&self) -> Vec<u8, 25> {
        let mut vec: Vec<u8, 25> = Vec::new();
        vec.push(MAGIC_CALIBRATION_FLAG).unwrap();
        vec.extend(
            self.dac4
                .iter()
                .flat_map(|x| x.iter().flat_map(|x| IntoIter::new(x.to_ne_bytes()))),
        );
        vec.extend(
            self.dac8
                .iter()
                .flat_map(|x| x.iter().flat_map(|x| IntoIter::new(x.to_ne_bytes()))),
        );
        vec
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
        leds: &mut LedDispatcher,
    ) -> Option<CalibrationResult> {
        if let Target::Start = self.target {
            self.advance(leds, now);
            self.calibrate(0.0, cvs, mods);
            return None;
        }
        if let Target::End = self.target {
            // TODO: This is for one channel only for now
            let result = CalibrationResult::from_points([self.dac4_data[0]], [self.dac8_data[0]]);
            return Some(result);
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
                cvs.set(chan, voltage + self.dac4_data[chan][v]);
            }
            Target::Dac8 => {
                let voltage = DAC8_VOLTAGES[v];
                self.dac8_data[chan][v] += offset;
                mods.set(chan, voltage + self.dac8_data[chan][v]);
            }
            _ => {}
        }
    }

    fn advance(&mut self, leds: &mut LedDispatcher, now: u32) {
        let (chan, v) = self.indices;
        match self.target {
            Target::Start => {
                leds.set(led::Action::BlinkOneFast(true, 0, led::GREEN), now);
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
                    leds.set(led::Action::Stop, now);
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
