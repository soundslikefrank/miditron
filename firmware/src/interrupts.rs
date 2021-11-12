#![allow(unsafe_code)]
#![allow(non_snake_case)]

use cortex_m::interrupt::free;
use hal::{pac, stm32::interrupt};
use rt::{exception, ExceptionFrame};

use crate::clock::Clock;
use crate::resources::Resources;

#[interrupt]
fn USART1() {
    free(|cs| {
        // TODO: how about we do this in the main loop as well and only set an AtomicBool to true
        // when this happens???
        let sr = unsafe { (*pac::USART1::ptr()).sr.read() };
        if sr.rxne().bit_is_set() {
            if let Some(res) = Resources::borrow(cs).as_mut() {
                let val = unsafe { (*pac::USART1::ptr()).dr.read().dr().bits() as u8 };
                res.midi_input.push(val);
            }
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
                unsafe { (*pac::USART1::ptr()).dr.read().bits() };
            }
        }
    });
}

#[exception]
fn SysTick() {
    Clock::tick();
    free(|cs| {
        if let Some(res) = Resources::borrow(cs).as_mut() {
            res.push_buttons.poll();
        }
    })
}

#[exception]
unsafe fn HardFault(ef: &ExceptionFrame) -> ! {
    panic!("{:#?}", ef);
}
