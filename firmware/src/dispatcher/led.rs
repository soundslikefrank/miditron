type Data = (u8, [u8; 3]);

pub enum Action {
    Cycle(usize, Data),
    Idle,
}

impl Action {
    fn to_cmd(&self) -> Option<Command<Data, 4>> {
        match self {
            Self::Cycle(idx, data) => {
                let mut cmd_data: [Option<Data>; 4] = [Some((0, [0; 3])); 4];
                cmd_data[*idx] = Some(*data);
                Some(Command(cmd_data))
            }
            Self::Idle => None,
        }
    }
}

use super::Command;
use crate::clock::Counter;

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

    pub fn dispatch(&mut self, action: Action, now: u32) {
        self.counter.reset(now);
        self.state = action;
    }

    pub fn next(&mut self, now: u32) -> Option<Command<Data, 4>> {
        match self.state {
            Action::Idle => self.state.to_cmd(),
            Action::Cycle(idx, data) => {
                if self.counter.elapsed(100, now) {
                    // TODO: write abstracting for this
                    let next_idx = if idx == 3 { 0 } else { idx + 1 };
                    let cmd = self.state.to_cmd();
                    self.state = Action::Cycle(next_idx, data);
                    return cmd;
                }
                None
            }
        }
    }
}
