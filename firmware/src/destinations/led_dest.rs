type Data = (u8, [u8; 3]);

pub enum Action {
    Cycle(usize, Data),
    BlinkOneFast(bool, usize, Data),
    Flash(usize, Data),
    Idle,
    Stop,
}

pub mod colors {
    use super::Data;

    pub const RED: Data = (100, [255, 0, 0]);
    pub const YELLOW: Data = (100, [255, 50, 0]);
    pub const GREEN: Data = (100, [0, 255, 0]);
    pub const PINK: Data = (100, [255, 0, 10]);

    pub const COLOR_ARRAY: [Data; 4] = [RED, YELLOW, GREEN, PINK];

    pub const WHITE: Data = (50, [255, 175, 175]);
}


impl Action {
    fn to_cmd(&self) -> Option<Command<Data, 4>> {
        match self {
            &Self::Cycle(idx, data) => {
                let mut cmd_data: [Option<Data>; 4] = [Some((0, [0; 3])); 4];
                cmd_data[idx] = Some(data);
                Some(Command(cmd_data))
            }
            &Self::BlinkOneFast(is_on, n, data) => {
                let mut cmd_data: [Option<Data>; 4] = [Some((0, [0; 3])); 4];
                if is_on {
                    cmd_data[n] = Some(data);
                }
                Some(Command(cmd_data))
            }
            &Self::Flash(n, data) => {
                let mut cmd_data: [Option<Data>; 4] = [None; 4];
                cmd_data[n] = Some(data);
                Some(Command(cmd_data))
            }
            Self::Stop => {
                let cmd_data: [Option<Data>; 4] = [Some((0, [0; 3])); 4];
                Some(Command(cmd_data))
            }
            _ => None,
        }
    }
}

use super::Command;
use crate::clock::Counter;

pub struct LedDestination {
    counter: Counter,
    state: Action,
}

impl LedDestination {
    pub fn new(f_refresh: u32) -> Self {
        Self {
            counter: Counter::new(f_refresh),
            state: Action::Idle,
        }
    }

    pub fn set(&mut self, action: Action, now: u32) {
        self.counter.reset(now);
        self.state = action;
    }

    pub fn next(&mut self, now: u32) -> Option<Command<Data, 4>> {
        match self.state {
            Action::Idle => None,
            Action::Stop => {
                let cmd = self.state.to_cmd();
                self.state = Action::Idle;
                return cmd;
            }
            Action::Cycle(idx, data) => {
                if self.counter.elapsed_ms(100, now) {
                    // TODO: write abstraction for this (see arp)
                    let next_idx = if idx == 3 { 0 } else { idx + 1 };
                    let cmd = self.state.to_cmd();
                    self.state = Action::Cycle(next_idx, data);
                    return cmd;
                }
                None
            }
            Action::BlinkOneFast(is_on, n, data) => {
                if self.counter.elapsed_ms(200, now) {
                    let cmd = self.state.to_cmd();
                    self.state = Action::BlinkOneFast(!is_on, n, data);
                    return cmd;
                }
                None
            }
            Action::Flash(_, _) => {
                if self.counter.elapsed_ms(100, now) {
                    self.state = Action::Stop;
                }
                return self.state.to_cmd();
            }
        }
    }
}
