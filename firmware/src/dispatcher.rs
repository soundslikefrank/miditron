use embedded_midi::{Control, MidiMessage as MM};

use crate::{
    calibrator::{CalibrationResult, Calibrator},
    destinations::{
        colors, ClockDestination, Command, CvDestination, Destination, EepromDestination,
        GateDestination, LedAction, LedDestination, ModDestination,
    },
    drivers::ButtonState,
    layout::Layout,
};

type Inputs = ([ButtonState; 4], Option<MM>, u32);
type Outputs = (
    Option<Command<f32, 4>>,
    Option<Command<bool, 4>>,
    Option<Command<f32, 8>>,
    Option<Command<(u8, [u8; 3]), 4>>,
    Option<(usize, [u8; 32])>,
    Option<Command<bool, 4>>,
);

enum State {
    Calibration,
    Default,
}

pub struct Dispatcher {
    calibrator: Calibrator,
    clocks: ClockDestination,
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
            clocks: ClockDestination::new(f_refresh),
            cvs: CvDestination::new(dac4_result),
            gates: GateDestination::new(),
            eeprom: EepromDestination::new(f_refresh),
            layout: Layout::new(),
            leds: LedDestination::new(f_refresh),
            mods: ModDestination::new(dac8_result),
            state: State::Default,
        }
    }

    pub fn process(&mut self, inputs: Option<Inputs>) -> Outputs {
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
                self.clocks.next(now),
            );
        }
        (None, None, None, None, None, None)
    }

    fn handle_button_presses(&mut self, button_states: [ButtonState; 4], now: u32) {
        match button_states {
            [ButtonState::Idle, ButtonState::Idle, ButtonState::Idle, ButtonState::Idle] => {}
            [ButtonState::LongPress, _, _, ButtonState::LongPress] => {
                self.state = State::Calibration;
            }
            [ButtonState::Press, _, _, _] => self.leds.set(LedAction::Flash(0, colors::PINK), now),
            [_, ButtonState::Press, _, _] => self.leds.set(LedAction::Flash(1, colors::PINK), now),
            [_, _, ButtonState::Press, _] => self.leds.set(LedAction::Flash(2, colors::PINK), now),
            [_, _, _, ButtonState::Press] => self.leds.set(LedAction::Flash(3, colors::PINK), now),
            _ => {}
        }
    }

    fn handle_midi_message(&mut self, midi_msg: Option<MM>, now: u32) {
        if let Some(midi_msg) = midi_msg {
            match midi_msg {
                MM::TimingClock => self.clocks.tick(now),
                MM::Start => self.clocks.run(),
                MM::Stop => self.clocks.stop(),
                MM::Continue => self.clocks.resume(),
                MM::NoteOn(channel, note, velocity) => {
                    if let Some(chan) = self.layout.get_channel(channel.into()) {
                        self.leds
                            .set(LedAction::Flash(chan, colors::COLOR_ARRAY[chan]), now);
                        self.cvs.set_from_note(chan, note.into());
                        self.gates.set(chan, true);
                        // self.mods.set_from_val7(chan, velocity.into());
                    }
                }
                MM::NoteOff(channel, _n, _v) => {
                    if let Some(chan) = self.layout.get_channel(channel.into()) {
                        self.gates.set(chan, false);
                        // TODO: this is another "layout?"
                        // self.mods.set(chan, 0.0);
                    }
                }
                MM::ControlChange(channel, cc, val) => {
                    if let Some(chan) = self.layout.get_mod_from_cc(channel.into(), cc.into())
                    {
                        self.mods.set_from_val7(chan, val.into());
                    }
                }
                _ => {}
            }
        }
    }
}
