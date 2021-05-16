#![allow(unsafe_code)]
#![allow(non_snake_case)]

use hal::{pac, stm32::interrupt};

use cortex_m::interrupt::free;

use crate::midi::MIDI_STREAM;

#[interrupt]
fn USART1() {
    free(|cs| {
        let is_rxne = unsafe { (*pac::USART1::ptr()).isr.read().rxne().bit_is_set() };
        if is_rxne {
            unsafe { (*pac::USART1::ptr()).rdr.read().bits() };
            let mut queue = MIDI_STREAM.borrow(cs).borrow_mut();
            queue
                .enqueue(unsafe { (*pac::USART1::ptr()).rdr.read().bits() } as u8)
                .ok();
        } else {
            // Clear rxne bit anyways
            unsafe { (*pac::USART1::ptr()).rqr.write(|w| w.rxfrq().set_bit()) }
        }
        // Clear all error flags
        unsafe {
            (*pac::USART1::ptr()).icr.write(|w| {
                w.idlecf()
                    .set_bit()
                    .orecf()
                    .set_bit()
                    .ncf()
                    .set_bit()
                    .fecf()
                    .set_bit()
                    .pecf()
                    .set_bit()
            })
        }
    });
}
