use heapless::{FnvIndexMap, IndexMap};
use hash32::{BuildHasherDefault, FnvHasher};

use ranged_num::Ranged;
use typenum::{U0, U9};

// FIXME: Start with one channel only at first, expand then
pub struct Arpeggiator {
    notes: IndexMap<u8, u8, BuildHasherDefault<FnvHasher>, 10>,
    index: Ranged<U0, U9, usize>,
}

impl Arpeggiator{
    pub fn new() -> Self {
        Self {
            notes: FnvIndexMap::<u8, u8, 10>::new(),
            index: Ranged::<U0, U9, usize>::new::<U0>(),
        }
    }

    // Pushes a note onto the arpeggiator
    // If it doesn't fit, it won't be added
    pub fn add(&mut self, note: u8, velocity: u8) -> () {
        self.notes.insert(note, velocity).ok();
    }

    pub fn remove(&mut self, note: u8) -> () {
        self.notes.remove(&note);
    }

    // Gets the next value from the arp
    pub fn next(&self) -> Option<(&u8, &u8)> {
        let idx = self.index.wrapped_add(1);
        self.notes.iter().nth(idx.value())
    }
}
