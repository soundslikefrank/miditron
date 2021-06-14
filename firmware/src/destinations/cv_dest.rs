use super::Destination;
use crate::calibrator::Dac4Result;

const VOLTS_PER_SEMITONE: f32 = 1_f32 / 12_f32;

pub struct CvDestination {
    data: [Option<f32>; 4],
    changed: bool,
    calibration: Dac4Result,
}

impl CvDestination {
    pub fn new(calibration: Dac4Result) -> Self {
        Self {
            calibration,
            changed: false,
            data: [None; 4],
        }
    }

    pub fn set_calibration(&mut self, calibration: Dac4Result) {
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

    pub fn set_from_note(&mut self, chan: usize, note: u8) {
        let volts = note as f32 * VOLTS_PER_SEMITONE;
        self.set_volts(chan, volts);
    }
}

impl Destination<f32, 4> for CvDestination {
    fn set_data(&mut self, chan: usize, val: f32) {
        self.data[chan] = Some(val);
    }
    fn get_data(&self) -> [Option<f32>; 4] {
        self.data
    }
    fn set_changed(&mut self, changed: bool) {
        self.changed = changed;
    }
    fn get_changed(&self) -> bool {
        self.changed
    }
}
