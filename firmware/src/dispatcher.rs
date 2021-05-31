use crate::clock::Clock;

pub mod led;

use self::led::LedDispatcher;

/* use core::fmt::Write;
use sh::hio; */

type CvDestination = Destination<f32, 4>;
type GateDestination = Destination<bool, 4>;
type ModDestination = Destination<f32, 8>;

pub struct Dispatcher {
    pub clock: Clock,
    leds: LedDispatcher,
    cvs: CvDestination,
    gates: GateDestination,
    mods: ModDestination,
}

impl Dispatcher {
    pub fn new(f_refresh: u32) -> Self {
        // leds.dispatch(led::Action::Cycle(128, [255, 0, 10]));
        Self {
            clock: Clock::new(),
            leds: LedDispatcher::new(f_refresh),
            cvs: Destination::new(),
            gates: Destination::new(),
            mods: Destination::new(),
        }
    }

    // TODO: this isn't really great
    pub fn get_commands(&mut self) -> (
        Option<Command<f32, 4>>,
        Option<Command<bool, 4>>,
        Option<Command<f32, 8>>,
        Option<Command<(u8, [u8; 3]), 4>>,
    ) {
        let now = self.clock.get();
        // TODO: Maybe return a struct here instead of a tupel?
        return (
            self.cvs.next(),
            self.gates.next(),
            self.mods.next(),
            self.leds.next(now),
        );
    }

    pub fn set_leds(&mut self, action: led::Action) {
        self.leds.dispatch(action, self.clock.get())
    }

    pub fn set_cvs(&mut self, chan: usize, val: f32) {
        self.cvs.set(chan, val);
    }

    pub fn set_gates(&mut self, chan: usize, val: bool) {
        self.gates.set(chan, val);
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
