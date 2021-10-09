type Data = bool;

pub enum Action {
    /// Set state to high
    High,
    /// Set state to low. Low(true): run is high, Low(false): run is low
    Low(bool),
    /// Idle(false): state is low; Idle(true): state is high
    Idle(bool),
}

use super::Command;
use crate::clock::Counter;

pub struct ClockDestination {
    counter: Counter,
    state: Action,
    pulse_counter: u32,
    running: bool,
}

impl ClockDestination {
    pub fn new(f_refresh: u32) -> Self {
        Self {
            counter: Counter::new(f_refresh),
            state: Action::Idle(false),
            pulse_counter: 0,
            running: false,
        }
    }

    pub fn run(&mut self) {
        self.running = true;
        self.pulse_counter = 0;
    }

    pub fn resume(&mut self) {
        self.running = true;
    }

    pub fn stop(&mut self) {
        self.state = Action::Low(false);
        self.running = false;
    }

    pub fn tick(&mut self, now: u32) {
        self.counter.reset(now);
        self.state = Action::High;
    }

    pub fn next(&mut self, now: u32) -> Option<Command<Data, 4>> {
        match self.state {
            Action::Idle(false) => None,
            Action::Idle(true) => {
                if self.counter.elapsed_ms(5, now) {
                    self.state = Action::Low(true);
                }
                None
            }
            Action::Low(true) => {
                self.state = Action::Idle(false);
                Some(Command([Some(false), None, Some(false), Some(false)]))
            }
            Action::Low(false) => {
                self.state = Action::Idle(false);
                Some(Command([Some(false); 4]))
            }
            Action::High => {
                let mut cmd_data: [Option<Data>; 4] = [None; 4];
                // TODO: this might not be the most performant way of doing this.
                // - No need to set the cmd_data[1] (run) every time (but there's a problem)
                // - Is modulo fast enough with high numbers? Can we reset?
                cmd_data[0] = Some(true);
                if self.running {
                    cmd_data[1] = Some(true);
                    if self.pulse_counter % 6 == 0 {
                        cmd_data[2] = Some(true);
                    }
                    if self.pulse_counter % 24 == 0 {
                        cmd_data[3] = Some(true);
                    }
                    self.pulse_counter += 1;
                }
                self.state = Action::Idle(true);
                Some(Command(cmd_data))
            }
        }
    }
}
