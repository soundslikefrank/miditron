use core::cell::RefCell;
use cortex_m::interrupt::{free, CriticalSection, Mutex};
use embedded_midi::{MidiMessage, MidiParser};
use heapless::spsc::Queue;

pub static MIDI_PARSER: Mutex<RefCell<Option<MidiParser>>> = Mutex::new(RefCell::new(None));
pub static MIDI_STREAM: Mutex<RefCell<Queue<u8, 128>>> = Mutex::new(RefCell::new(Queue::new()));

pub struct MidiStream;

impl MidiStream {
    pub fn init() {
        free(move |cs| {
            let mut parser = MIDI_PARSER.borrow(cs).borrow_mut();
            *parser = Some(MidiParser::new());
        });
    }

    pub fn on_message<F>(cs: &CriticalSection, f: F) -> ()
    where
        F: Fn(MidiMessage) -> (),
    {
        let mut queue = MIDI_STREAM.borrow(cs).borrow_mut();
        if queue.is_empty() {
            return;
        }
        if queue.is_full() {
            // This should really not happen, let's panic
            panic!("Queue is full");
        }
        if let Some(parser) = MIDI_PARSER.borrow(cs).borrow_mut().as_mut() {
            while let Some(byte) = queue.dequeue() {
                if let Some(msg) = parser.parse_byte(byte) {
                    f(msg)
                }
            }
        }
    }
}
