use cortex_m::interrupt::CriticalSection;

use core::cell::{RefCell, RefMut};
use cortex_m::interrupt::{free, Mutex};

use crate::drivers::ButtonState;

static DISPATCHER: Mutex<RefCell<Option<Dispatcher>>> = Mutex::new(RefCell::new(None));

const VOLTS_PER_SEMITONE: f32 = 1_f32 / 12_f32;

/* use core::fmt::Write;
use sh::hio; */

// Change this (tupel of colors and brightness? more complex instructions?)
type LedDestination = Destination<(u8, [u8; 3]), 4>;
type CvDestination = Destination<f32, 4>;
type GateDestination = Destination<bool, 4>;
type ModDestination = Destination<f32, 8>;

pub struct Dispatcher {
    leds: LedDestination,
    cvs: CvDestination,
    gates: GateDestination,
    mods: ModDestination,
    layout: Layout,
}

impl Dispatcher {
    pub fn init() {
        free(|cs| {
            let mut dispatcher = DISPATCHER.borrow(cs).borrow_mut();
            *dispatcher = Some(Dispatcher::new());
        });
    }

    pub fn new() -> Self {
        Self {
            leds: Destination::new(),
            cvs: Destination::new(),
            gates: Destination::new(),
            mods: Destination::new(),
            layout: Layout::new(),
        }
    }

    pub fn borrow(cs: &CriticalSection) -> RefMut<Option<Dispatcher>> {
        DISPATCHER.borrow(cs).borrow_mut()
    }

    // TODO: this isn't really great
    pub fn get_commands(
        cs: &CriticalSection,
    ) -> (
        Option<Command<f32, 4>>,
        Option<Command<bool, 4>>,
        Option<Command<f32, 8>>,
        Option<Command<(u8, [u8; 3]), 4>>,
    ) {
        if let Some(d) = DISPATCHER.borrow(cs).borrow_mut().as_mut() {
            // TODO: Maybe return a struct here instead of a tupel?
            return (d.cvs.next(), d.gates.next(), d.mods.next(), d.leds.next());
        }
        (None, None, None, None)
    }

    // TODO: handle velocity (dynamic gates)
    pub fn handle_note_on(&mut self, midi_chan: u8, midi_note: u8, _velocity: u8) -> () {
        if let Some(chan) = self.layout.get_channel(midi_chan) {
            self.cvs.set(chan, Self::cv_from_note(midi_note));
            self.gates.set(chan, true);
        }
    }

    pub fn handle_note_off(&mut self, midi_chan: u8) -> () {
        if let Some(chan) = self.layout.get_channel(midi_chan) {
            self.gates.set(chan, false);
        }
    }

    pub fn handle_button_presses(
        &mut self,
        btn_states: (ButtonState, ButtonState, ButtonState, ButtonState),
    ) -> () {
        match btn_states {
            (ButtonState::Press, _, _, _) => {
                self.leds.set(0, (128, [255, 0, 10]));
            }
            _ => {}
        }
    }

    fn cv_from_note(note: u8) -> f32 {
        note as f32 * VOLTS_PER_SEMITONE
    }
}

pub struct Command<T, const N: usize>([Option<T>; N]);

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

struct Destination<T, const N: usize> {
    data: [Option<T>; N],
    changed: bool,
}

impl<T: Copy, const N: usize> Destination<T, N> {
    // TODO: this will be more complex as the data might not be an on/off kind of thing
    // Use this to implement triggers/ envelopes/etc
    // IDEA: use iterators??
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
    pub fn next(&mut self) -> Option<Command<T, N>> {
        if !self.changed {
            return None;
        }
        self.changed = false;
        let mut data: [Option<T>; N] = [None; N];
        data.copy_from_slice(&self.data);
        Some(Command(data))
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
