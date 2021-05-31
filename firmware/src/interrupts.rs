#![allow(unsafe_code)]
#![allow(non_snake_case)]

use cortex_m::interrupt::free;
use hal::{pac, stm32::interrupt};
use rt::ExceptionFrame;

use crate::drivers::PushButtons;
use crate::midi::Midi;
use crate::multi::Multi;

#[interrupt]
fn USART1() {
    free(|cs| {
        let sr = unsafe { (*pac::USART1::ptr()).sr.read() };
        if sr.rxne().bit_is_set() {
            let mut queue = Midi::borrow_queue(cs);
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

#[exception]
fn SysTick() {
    free(|cs| {
        if let Some(multi) = Multi::borrow(cs).as_mut() {
            multi.dispatcher.clock.tick();

            if let Some(msg) = Midi::read(cs) {
                multi.handle_midi_msg(msg);
            }

            if let Some(btn_states) = PushButtons::read_all(cs) {
                multi.handle_button_presses(btn_states);
            }
        }
    })
}

#[exception]
fn HardFault(ef: &ExceptionFrame) -> ! {
    panic!("{:#?}", ef);
}
