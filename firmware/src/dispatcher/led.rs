type Data = (u8, [u8; 3]);

pub enum Action {
    Cycle(usize, Data),
    BlinkOneFast(bool, usize, Data),
    Idle,
    Stop,
}

pub const GREEN: (u8, [u8;  3]) = (175, [0, 255, 0]);

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
            Self::Stop => {
                let cmd_data: [Option<Data>; 4] = [Some((0, [0; 3])); 4];
                Some(Command(cmd_data))
            },
            _ => None,
        }
    }
}

use super::Command;
use crate::clock::Counter;

// FIXME rename
pub struct LedDispatcher {
    counter: Counter,
    state: Action,
}

impl LedDispatcher {
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
        }
    }
}
