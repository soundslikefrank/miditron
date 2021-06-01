use embedded_midi::MidiMessage as MM;

pub mod led;

use self::led::LedDispatcher;
use crate::{drivers::ButtonState, layout::Layout};

type CvDestination = Destination<f32, 4>;
type GateDestination = Destination<bool, 4>;
type ModDestination = Destination<f32, 8>;

const VOLTS_PER_SEMITONE: f32 = 1_f32 / 12_f32;

pub struct Inputs {
    pub midi_msg: Option<MM>,
    pub button_states: [ButtonState; 4],
    pub now: u32,
}

pub struct Dispatcher {
    layout: Layout,
    leds: LedDispatcher,
    cvs: CvDestination,
    gates: GateDestination,
    mods: ModDestination,
}

impl Dispatcher {
    fn cv_from_note(note: u8) -> f32 {
        note as f32 * VOLTS_PER_SEMITONE
    }

    pub fn new(f_refresh: u32) -> Self {
        // leds.dispatch(led::Action::Cycle(128, [255, 0, 10]));
        Self {
            layout: Layout::new(),
            leds: LedDispatcher::new(f_refresh),
            cvs: Destination::new(),
            gates: Destination::new(),
            mods: Destination::new(),
        }
    }

    pub fn process(
        &mut self,
        inputs: Option<Inputs>,
    ) -> (
        Option<Command<f32, 4>>,
        Option<Command<bool, 4>>,
        Option<Command<f32, 8>>,
        Option<Command<(u8, [u8; 3]), 4>>,
    ) {
        if let Some(inputs) = inputs {
            match inputs.button_states {
                [ButtonState::Press, _, _, _] => {
                    self.leds
                        // FIXME: rename this is terrible
                        // or maybe just refactor?
                        .dispatch(led::Action::Cycle(0, (128, [255, 0, 10])), inputs.now);
                }
                _ => {}
            }

            if let Some(midi_msg) = inputs.midi_msg {
                match midi_msg {
                    MM::NoteOn(channel, note, _value) => {
                        if let Some(chan) = self.layout.get_channel(channel.into()) {
                            self.cvs.set(chan, Self::cv_from_note(note.into()));
                            self.gates.set(chan, true);
                        }
                    }
                    MM::NoteOff(channel, _n, _v) => {
                        if let Some(chan) = self.layout.get_channel(channel.into()) {
                            self.gates.set(chan, false);
                        }
                    }
                    _ => {}
                }
            }

            return (
                self.cvs.next(),
                self.gates.next(),
                self.mods.next(),
                self.leds.next(inputs.now),
            );
        }
        (None, None, None, None)
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
