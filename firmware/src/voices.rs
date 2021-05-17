use cortex_m::interrupt::CriticalSection;
use embedded_midi::MidiMessage;

pub struct Voices;

impl Voices {
    pub fn process(_cs: &CriticalSection, msg: MidiMessage) {
        match msg {
            MidiMessage::NoteOn(_ch, _no, _vel) => {},
            _ => {},
        }
    }
}
