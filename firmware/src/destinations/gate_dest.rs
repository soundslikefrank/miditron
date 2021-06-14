use super::Destination;

pub struct GateDestination {
    data: [Option<bool>; 4],
    changed: bool,
}

impl GateDestination {
    pub fn new() -> Self {
        Self {
            changed: false,
            data: [None; 4],
        }
    }
}

impl Destination<bool, 4> for GateDestination {
    fn set_data(&mut self, chan: usize, val: bool) {
        self.data[chan] = Some(val);
    }
    fn get_data(&self) -> [Option<bool>; 4] {
        self.data
    }
    fn set_changed(&mut self, changed: bool) {
        self.changed = changed;
    }
    fn get_changed(&self) -> bool {
        self.changed
    }
}
