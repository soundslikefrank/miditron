use embedded_midi::MidiMessage as MM;

use crate::{
    calibrator::{CalibrationResult, Calibrator},
    destinations::{
        colors::YELLOW, Command, CvDestination, Destination, EepromDestination, GateDestination,
        LedAction, LedDestination, ModDestination,
    },
    drivers::ButtonState,
    layout::Layout,
};

type Inputs = ([ButtonState; 4], Option<MM>, u32);

enum State {
    Calibration,
    Default,
}

pub struct Dispatcher {
    calibrator: Calibrator,
    eeprom: EepromDestination,
    layout: Layout,
    leds: LedDestination,
    cvs: CvDestination,
    gates: GateDestination,
    mods: ModDestination,
    state: State,
}

impl Dispatcher {
    pub fn new(f_refresh: u32, calibration_bytes: &[u8]) -> Self {
        let (dac4_result, dac8_result) = CalibrationResult::from_bytes(calibration_bytes).split();

        Self {
            calibrator: Calibrator::new(),
            eeprom: EepromDestination::new(f_refresh),
            layout: Layout::new(),
            leds: LedDestination::new(f_refresh),
            cvs: CvDestination::new(dac4_result),
            gates: GateDestination::new(),
            mods: ModDestination::new(dac8_result),
            state: State::Default,
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
        Option<(usize, [u8; 32])>,
    ) {
        if let Some((button_states, midi_msg, now)) = inputs {
            match self.state {
                State::Calibration => {
                    if let Some(result) = self.calibrator.process(
                        button_states,
                        now,
                        &mut self.cvs,
                        &mut self.mods,
                        &mut self.leds,
                    ) {
                        self.state = State::Default;
                        self.eeprom.set(0, &result.to_bytes(), now);
                        let (dac4_result, dac8_result) = result.split();
                        self.cvs.set_calibration(dac4_result);
                        self.mods.set_calibration(dac8_result);
                    }
                }
                State::Default => {
                    self.handle_button_presses(button_states, now);
                    self.handle_midi_message(midi_msg, now);
                }
            }
            return (
                self.cvs.next(),
                self.gates.next(),
                self.mods.next(),
                self.leds.next(now),
                self.eeprom.next(now),
            );
        }
        (None, None, None, None, None)
    }

    fn handle_button_presses(&mut self, button_states: [ButtonState; 4], _now: u32) {
        match button_states {
            [ButtonState::Idle, ButtonState::Idle, ButtonState::Idle, ButtonState::Idle] => {}
            [ButtonState::LongPress, _, _, ButtonState::LongPress] => {
                self.state = State::Calibration;
            }
            _ => {}
        }
    }

    fn handle_midi_message(&mut self, midi_msg: Option<MM>, now: u32) {
        if let Some(midi_msg) = midi_msg {
            match midi_msg {
                MM::NoteOn(channel, note, velocity) => {
                    self.leds.set(LedAction::Flash(0, YELLOW), now);
                    if let Some(chan) = self.layout.get_channel(channel.into()) {
                        self.cvs.set_from_note(chan, note.into());
                        self.gates.set(chan, true);
                        self.mods.set_from_velocity(chan, velocity.into());
                    }
                }
                MM::NoteOff(channel, _n, _v) => {
                    if let Some(chan) = self.layout.get_channel(channel.into()) {
                        self.gates.set(chan, false);
                        self.mods.set(chan, 0.0);
                    }
                }
                _ => {}
            }
        }
    }
}
