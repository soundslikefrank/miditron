type Data = bool;

pub enum Action {
    /// Set state to high
    High,
    /// Set state to low
    Low,
    /// Idle(false): State is low; Idle(true): State is high
    Idle(bool),
}

impl Action {
    fn to_cmd(&self) -> Option<Command<Data, 4>> {
        match self {
            Self::High => {
                let cmd_data: [Option<Data>; 4] = [Some(true); 4];
                Some(Command(cmd_data))
            }
            Self::Low => {
                let cmd_data: [Option<Data>; 4] = [Some(false); 4];
                Some(Command(cmd_data))
            }
            _ => None,
        }
    }
}

use super::Command;
use crate::clock::Counter;

pub struct ClockDestination {
    counter: Counter,
    state: Action,
    running: bool,
}

impl ClockDestination {
    pub fn new(f_refresh: u32) -> Self {
        Self {
            counter: Counter::new(f_refresh),
            state: Action::Idle(false),
            running: false,
        }
    }

    pub fn start() {}

    pub fn stop() {}

    pub fn set(&mut self, action: Action, now: u32) {
        self.counter.reset(now);
        self.state = action;
    }

    pub fn next(&mut self, now: u32) -> Option<Command<Data, 4>> {
        match self.state {
            Action::Idle(false) => None,
            Action::Idle(true) => {
                if self.counter.elapsed_ms(5, now) {
                    self.state = Action::Low;
                }
                None
            }
            Action::Low => {
                let cmd = self.state.to_cmd();
                self.state = Action::Idle(false);
                return cmd;
            }
            Action::High => {
                let cmd = self.state.to_cmd();
                self.state = Action::Idle(true);
                return cmd;
            }
        }
    }
}
