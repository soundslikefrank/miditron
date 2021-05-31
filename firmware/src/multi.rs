// FIXME: Definitely rename this

use cortex_m::interrupt::CriticalSection;

use core::cell::{RefCell, RefMut};
use cortex_m::interrupt::{free, Mutex};
use embedded_midi::MidiMessage as MM;

use crate::dispatcher::led;
use crate::dispatcher::Dispatcher;
use crate::drivers::ButtonState;

static MULTI: Mutex<RefCell<Option<Multi>>> = Mutex::new(RefCell::new(None));

const VOLTS_PER_SEMITONE: f32 = 1_f32 / 12_f32;

pub struct Multi {
    pub dispatcher: Dispatcher,
    layout: Layout,
}

impl Multi {
    pub fn init(f_refresh: u32) {
        free(|cs| MULTI.borrow(cs).replace(Some(Multi::new(f_refresh))));
    }

    pub fn new(f_refresh: u32) -> Self {
        Self {
            dispatcher: Dispatcher::new(f_refresh),
            layout: Layout::new(),
        }
    }

    pub fn borrow(cs: &CriticalSection) -> RefMut<Option<Multi>> {
        MULTI.borrow(cs).borrow_mut()
    }

    fn cv_from_note(note: u8) -> f32 {
        note as f32 * VOLTS_PER_SEMITONE
    }

    pub fn handle_midi_msg(&mut self, msg: MM) {
        match msg {
            MM::NoteOn(channel, note, _value) => {
                if let Some(chan) = self.layout.get_channel(channel.into()) {
                    self.dispatcher
                        .set_cvs(chan, Self::cv_from_note(note.into()));
                    self.dispatcher.set_gates(chan, true);
                }
            }
            MM::NoteOff(channel, _n, _v) => {
                if let Some(chan) = self.layout.get_channel(channel.into()) {
                    self.dispatcher.set_gates(chan, false);
                }
            }
            _ => {}
        }
    }

    pub fn handle_button_presses(
        &mut self,
        btn_states: (ButtonState, ButtonState, ButtonState, ButtonState),
    ) -> () {
        match btn_states {
            (ButtonState::Press, _, _, _) => {
                self.dispatcher
                    .set_leds(led::Action::Cycle(0, (128, [255, 0, 10])));
            }
            _ => {}
        }
    }
}

struct Layout {
    // FIXME: definitely not flexible enough
    channels: [u8; 4],
}

impl Layout {
    fn new() -> Self {
        Self {
            channels: [0, 2, 2, 2],
        }
    }
    // FIXME: like this it is not possible to map one midi channel to two gates
    // Also do we need to set it independently?
    fn get_channel(&self, midi_channel: u8) -> Option<usize> {
        // FIXME: also not really great
        self.channels.iter().position(|c| *c == midi_channel)
    }
}
