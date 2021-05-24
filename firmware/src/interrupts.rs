#![allow(unsafe_code)]
#![allow(non_snake_case)]

use hal::{pac, stm32::interrupt};
use cortex_m::interrupt::free;
use crate::midi::MidiStream;

#[interrupt]
fn USART1() {
    free(|cs| {
        let sr = unsafe { (*pac::USART1::ptr()).sr.read() };
        if sr.rxne().bit_is_set() {
            let mut queue = MidiStream::borrow_queue(cs);
            queue
                .enqueue(unsafe { (*pac::USART1::ptr()).dr.read().bits() as u8 })
                .ok();
        } else {
            // Check for errors
            if sr.idle().bit_is_set()
                || sr.ore().bit_is_set()
                || sr.nf().bit_is_set()
                || sr.fe().bit_is_set()
                || sr.pe().bit_is_set()
            {
                // Clear all error flags (just read DR register)
                // RM: This bit is set by hardware when a de-synchronization, excessive noise or a break character is detected. It is cleared by a software sequence (an read to the USART_SR register followed by a read to the USART_DR register).
                unsafe { (*pac::USART1::ptr()).dr.read().bits() as u8 };
            }
        }
    });
}
