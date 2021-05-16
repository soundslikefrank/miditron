use core::{cell::RefCell, convert::TryFrom};
use cortex_m::interrupt::{free, Mutex};
use heapless::spsc::Queue;
pub use wmidi::{MidiMessage, StreamParser};

pub const MIDI_BUF_LEN: usize = 512;

pub static MIDI_PARSER: Mutex<RefCell<Option<StreamParser<MIDI_BUF_LEN>>>> = Mutex::new(RefCell::new(None));
pub static MIDI_STREAM: Mutex<RefCell<Queue<u8, 128>>> = Mutex::new(RefCell::new(Queue::new()));

pub struct MidiStream;

impl MidiStream {
    pub fn init(message_buffer: &'static mut [u8; MIDI_BUF_LEN]) {
        free(move |cs| {
            let mut parser = MIDI_PARSER.borrow(cs).borrow_mut();
            *parser = Some(StreamParser::new(message_buffer));
        });
    }

    pub fn on_message<F>(f: F) -> ()
    where
        F: Fn(MidiMessage) -> (),
    {
        free(|cs| {
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
                    if let Some(msg) = parser
                        .process_byte(byte)
                        .and_then(|b| MidiMessage::try_from(b).ok())
                    {
                        f(msg)
                    }
                }
            }
        });
    }
}
