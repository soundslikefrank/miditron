use core::cell::{RefCell, RefMut};

use cortex_m::interrupt::{CriticalSection, Mutex};

use crate::drivers::{MidiInput, PushButtons};

pub static RESOURCES: Mutex<RefCell<Option<Resources>>> = Mutex::new(RefCell::new(None));

pub struct Resources {
    pub midi_input: MidiInput,
    pub push_buttons: PushButtons,
}

impl Resources {
    fn new(push_buttons: PushButtons, midi_input: MidiInput) -> Self {
        Self {
            midi_input,
            push_buttons,
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
}
