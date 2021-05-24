use cortex_m::interrupt::CriticalSection;

use core::cell::RefCell;
use cortex_m::interrupt::{free, Mutex};
use embedded_midi::MidiMessage;

static DISPATCHER: Mutex<RefCell<Option<Dispatcher>>> = Mutex::new(RefCell::new(None));

const VOLTS_PER_SEMITONE: f32 = 1_f32 / 12_f32;

/* use core::fmt::Write;
use sh::hio; */

pub struct Dispatcher {
    cvs: Destination<f32, 4>,
    mods: Destination<u8, 8>,
    gates: Destination<bool, 4>,
    layout: Layout,
}

impl Dispatcher {
    pub fn init() {
        free(move |cs| {
            let mut dispatcher = DISPATCHER.borrow(cs).borrow_mut();
            *dispatcher = Some(Dispatcher::new());
        });
    }

    pub fn new() -> Self {
        Self {
            cvs: Destination::new(),
            mods: Destination::new(),
            gates: Destination::new(),
            layout: Layout::new(),
        }
    }

    pub fn process_midi_message(cs: &CriticalSection, msg: MidiMessage) {
        /* if let Ok(mut hstdout) = hio::hstdout() {
            writeln!(hstdout, "{:?}", msg).ok();
        } */
        if let Some(d) = DISPATCHER.borrow(cs).borrow_mut().as_mut() {
            match msg {
                MidiMessage::NoteOn(chan, note, vel) => {
                    d.handle_note_on(chan.into(), note.into(), vel.into())
                }
                _ => {}
            }
        }
    }

    // TODO: handle velocity (dynamic gates)
    fn handle_note_on(&mut self, midi_chan: u8, midi_note: u8, _velocity: u8) -> () {
        if let Some(chan) = self.layout.get_channel(midi_chan) {
            self.cvs.set(chan, Self::cv_from_note(midi_note));
            self.gates.set(chan, true);
        }
    }

    fn cv_from_note(note: u8) -> f32 {
        note as f32 * VOLTS_PER_SEMITONE
    }
}

struct Destination<T, const N: usize> {
    data: [Option<T>; N],
    changed: bool,
}

impl<T: Copy, const N: usize> Destination<T, N> {
    // TODO: this will be more complex as the data might not be an on/off kind of thing
    // Use this to implement triggers/ envelopes/etc
    pub fn new() -> Self {
        Self {
            data: [None; N],
            changed: false,
        }
    }
    pub fn set(&mut self, n: usize, val: T) {
        self.data[n] = Some(val);
        self.changed = true;
    }
    pub fn changed(&self) -> bool {
        self.changed
    }
    pub fn get(&mut self) -> [Option<T>; N] {
        self.changed = false;
        let mut data: [Option<T>; N] = [None; N];
        data.copy_from_slice(&self.data);
        data
    }
}

struct Layout {
    // FIXME: definitely not flexible enough
    channels: [u8; 4],
}

impl Layout {
    fn new() -> Self {
        Self { channels: [0; 4] }
    }
    fn get_channel(&self, midi_channel: u8) -> Option<usize> {
        // FIXME: also not really great
        self.channels.iter().position(|c| *c == midi_channel)
    }
}
