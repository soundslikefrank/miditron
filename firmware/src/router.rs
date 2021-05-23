use cortex_m::interrupt::CriticalSection;
use embedded_midi::{Channel, MidiMessage, Note};

use core::cell::RefCell;
use cortex_m::interrupt::{free, Mutex};

static DESTINATIONS: Mutex<RefCell<Option<DestinationMap>>> = Mutex::new(RefCell::new(None));

const VOLTS_PER_SEMITONE: f32 = 1_f32 / 12_f32;

/* use core::fmt::Write;
use sh::hio; */

struct DestinationMap {
    cvs: Destination<f32, 4>,
    mods: Destination<u8, 8>,
    gates: Destination<bool, 4>,
}

impl DestinationMap {
    pub fn new() -> Self {
        Self {
            cvs: Destination::new(),
            mods: Destination::new(),
            gates: Destination::new(),
        }
    }
    // TODO: I don't know if this implementation makes sense here
    // This could at least go into another file
    pub fn cv_set_note(&mut self, chan: Channel, note: Note) -> () {
        let chan: u8 = chan.into();
        let note: u8 = note.into();
        let v = note as f32 * VOLTS_PER_SEMITONE;
        self.cvs.set(chan as usize, v);
    }

    pub fn gate_set_high(&mut self, chan: Channel) -> () {
        let chan: u8 = chan.into();
        self.gates.set(chan as usize, true);
    }
}

// TODO: idea: implement this as DestinationData or so and embed it in the actual destinations
// Like Cvs, Mods or Gates
struct Destination<T, const N: usize> {
    data: [Option<T>; N],
    changed: bool,
}

impl<T: Copy, const N: usize> Destination<T, N> {
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

pub struct Router;

impl Router {
    pub fn init() {
        free(move |cs| {
            let mut dest = DESTINATIONS.borrow(cs).borrow_mut();
            *dest = Some(DestinationMap::new());
        });
    }
    pub fn process(cs: &CriticalSection, msg: MidiMessage) {
        /* if let Ok(mut hstdout) = hio::hstdout() {
            writeln!(hstdout, "{:?}", msg).ok();
        } */
        // NOTE: the routing here will be heavily influenced by the layout, so we have to find
        // a solution that's flexible enough to abstract that
        if let Some(dest) = DESTINATIONS.borrow(cs).borrow_mut().as_mut() {
            match msg {
                MidiMessage::NoteOn(chan, note, _vel) => {
                    // FIXME: here we assume that MIDI channel 1 = CV channel 1.
                    // This is the first part of the layout routing we have to tackle
                    // layout.get_destination?
                    // layout.get_channel()??
                    dest.cv_set_note(chan, note);
                    dest.gate_set_high(chan);
                }
                _ => {}
            }
        }
    }
}
