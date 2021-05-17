use cortex_m::interrupt::CriticalSection;
use wmidi::MidiMessage;

pub struct Voices;

impl Voices {
    pub fn process(cs: &CriticalSection, msg: MidiMessage) {
        match msg {
            MidiMessage::NoteOn(ch, no, vel) => {},
            _ => {},
        }
    }
}
