mod cv_dest;
mod eeprom_dest;
mod gate_dest;
mod led_dest;
mod mod_dest;

pub use {
    cv_dest::CvDestination,
    eeprom_dest::EepromDestination,
    gate_dest::GateDestination,
    led_dest::LedDestination,
    // TODO: make functions for this I guess
    led_dest::{colors, Action as LedAction},
    mod_dest::ModDestination,
};

pub struct Command<T, const N: usize>(pub [Option<T>; N]);

impl<T, const N: usize> Command<T, N> {
    pub fn for_each<F>(&self, mut f: F) -> ()
    where
        F: FnMut((usize, &T)),
    {
        self.0
            .iter()
            .enumerate()
            .filter(|(_i, v)| v.is_some())
            .for_each(|(i, v)| f((i, v.as_ref().unwrap())))
    }
}

pub trait Destination<T: Copy, const N: usize> {
    fn set_data(&mut self, n: usize, val: T);
    fn get_data(&self) -> [Option<T>; N];
    fn get_changed(&self) -> bool;
    fn set_changed(&mut self, changed: bool);

    fn set(&mut self, n: usize, val: T) {
        self.set_data(n, val);
        self.set_changed(true);
    }

    fn next(&mut self) -> Option<Command<T, N>> {
        if self.get_changed() {
            self.set_changed(false);
            let mut data: [Option<T>; N] = [None; N];
            data.copy_from_slice(&self.get_data());
            return Some(Command(data));
        }
        None
    }
}
