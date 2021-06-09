use core::cell::{RefCell, RefMut};

use cortex_m::interrupt::{CriticalSection, Mutex};

use crate::clock::Clock;
use crate::drivers::{MidiInput, PushButtons};

pub static RESOURCES: Mutex<RefCell<Option<Resources>>> = Mutex::new(RefCell::new(None));

pub struct Resources {
    pub clock: Clock,
    pub midi_input: MidiInput,
    pub push_buttons: PushButtons,
    calibrate: bool,
}

impl Resources {
    fn new(push_buttons: PushButtons, midi_input: MidiInput) -> Self {
        Self {
            clock: Clock::new(),
            midi_input,
            push_buttons,
            calibrate: false,
        }
    }

    pub fn init(cs: &CriticalSection, push_buttons: PushButtons, midi_input: MidiInput) {
        RESOURCES
            .borrow(cs)
            .replace(Some(Resources::new(push_buttons, midi_input)));
    }

    pub fn borrow(cs: &CriticalSection) -> RefMut<Option<Self>> {
        RESOURCES.borrow(cs).borrow_mut()
    }

    // TODO: consider to put this all into one module (Calibrator?)
    pub fn set_calibrate(&mut self) {
        self.calibrate = true;
    }

    // Calibration can just be true once
    pub fn read_calibrate(&mut self) -> bool {
        if self.calibrate {
            self.calibrate = false;
            return true;
        }
        false
    }
}
