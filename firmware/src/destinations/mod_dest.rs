use super::Destination;
use crate::calibrator::Dac8Result;

const VOLTS_PER_VELOCITY: f32 = 5_f32 / 127_f32;

pub struct ModDestination {
    data: [Option<f32>; 8],
    changed: bool,
    calibration: Dac8Result,
}

impl ModDestination {
    pub fn new(calibration: Dac8Result) -> Self {
        Self {
            calibration,
            changed: false,
            data: [None; 8],
        }
    }

    pub fn set_calibration(&mut self, calibration: Dac8Result) {
        self.calibration = calibration;
    }

    pub fn set_raw(&mut self, chan: usize, volts: f32) {
        self.set(chan, volts);
    }

    pub fn set_volts(&mut self, chan: usize, volts: f32) {
        let [a, b, c] = self.calibration[chan];
        let offset = a * (volts * volts) + b * volts + c;
        self.set(chan, volts + offset);
    }

    pub fn set_from_velocity(&mut self, chan: usize, velo: u8) {
        let volts = velo as f32 * VOLTS_PER_VELOCITY;
        self.set_volts(chan, volts);
    }
}

impl Destination<f32, 8> for ModDestination {
    fn set_data(&mut self, chan: usize, val: f32) {
        self.data[chan] = Some(val);
    }
    fn get_data(&self) -> [Option<f32>; 8] {
        self.data
    }
    fn set_changed(&mut self, changed: bool) {
        self.changed = changed;
    }
    fn get_changed(&self) -> bool {
        self.changed
    }
}
