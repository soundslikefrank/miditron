//! Test the serial interface using an interrupt
//!
#![no_main]
#![no_std]

extern crate cortex_m;
#[macro_use(entry, exception)]
extern crate cortex_m_rt as rt;
extern crate cortex_m_semihosting as sh;
extern crate panic_semihosting;

extern crate stm32l4xx_hal as hal;

use core::cell::RefCell;
use heapless::spsc::Queue;

use crate::hal::pac;
use crate::hal::prelude::*;
use crate::hal::serial::{Config, Event, Serial};
use crate::hal::stm32::interrupt;

use crate::hal::delay::Delay;
use crate::rt::ExceptionFrame;
use cortex_m::{
    interrupt::{free, Mutex},
    peripheral::NVIC,
};

use crate::sh::hio;
use core::fmt::Write;

static QUEUE: Mutex<RefCell<Queue<u8, 12>>> = Mutex::new(RefCell::new(Queue::new()));

#[entry]
fn main() -> ! {
    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = hal::stm32::Peripherals::take().unwrap();

    let mut flash = dp.FLASH.constrain();
    let mut rcc = dp.RCC.constrain();
    let mut pwr = dp.PWR.constrain(&mut rcc.apb1r1);

    let mut gpioa = dp.GPIOA.split(&mut rcc.ahb2);

    let clocks = rcc
        .cfgr
        .sysclk(80.mhz())
        .pclk1(80.mhz())
        .pclk2(80.mhz())
        .freeze(&mut flash.acr, &mut pwr);

    let tx = gpioa.pa9.into_af7(&mut gpioa.moder, &mut gpioa.afrh);

    let rx = gpioa.pa10.into_af7(&mut gpioa.moder, &mut gpioa.afrh);

    let mut serial = Serial::usart1(
        dp.USART1,
        (tx, rx),
        Config::default().baudrate(31_250.bps()),
        clocks,
        &mut rcc.apb2,
    );

    // Set the rxneie interrupt bit
    serial.listen(Event::Rxne);

    unsafe {
        NVIC::unmask(interrupt::USART1);
    }

    let mut timer = Delay::new(cp.SYST, clocks);

    // let (mut producer, mut consumer) = queue.split();

    loop {
        timer.delay_ms(1000_u32);
        let last = free(|cs| {
            let mut queue = QUEUE.borrow(cs).borrow_mut();
            if let Some(value) = queue.dequeue() {
                value
            } else {
                0
            }
        });
        if let Ok(mut hstdout) = hio::hstdout() {
            // Q: We don't really care if that's not working, is `ok()` fine here?
            writeln!(hstdout, "{}", last).ok();
        }
    }
}

#[interrupt]
/// Async USART read interrupt handler
fn USART1() {
    unsafe { (*pac::USART1::ptr()).rqr.write(|w| w.rxfrq().set_bit()) }

    free(|cs| {
        let mut queue = QUEUE.borrow(cs).borrow_mut();
        // Fire and forget?
        queue
            .enqueue(unsafe { (*pac::USART1::ptr()).rdr.read().bits() } as u8)
            .ok();
    });
}

#[exception]
fn HardFault(ef: &ExceptionFrame) -> ! {
    panic!("{:#?}", ef);
}
