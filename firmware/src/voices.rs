use cortex_m::interrupt::CriticalSection;
use embedded_midi::MidiMessage;

use core::fmt::Write;
use sh::hio;

pub struct Voices;

impl Voices {
    pub fn process(_cs: &CriticalSection, msg: MidiMessage) {
        if let Ok(mut hstdout) = hio::hstdout() {
            writeln!(hstdout, "{:?}", msg).ok();
        }
        /* match msg {
            MidiMessage::NoteOn(_ch, _no, _vel) => {},
            _ => {},
        } */
    }
}
