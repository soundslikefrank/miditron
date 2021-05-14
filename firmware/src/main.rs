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
use hal::time::MegaHertz;
use heapless::spsc::Queue;

use hal::{
    pac,
    prelude::*,
    serial::{Config, Event, Serial},
    stm32::interrupt,
};

use rt::ExceptionFrame;
use cortex_m::{
    interrupt::{free, Mutex},
    peripheral::{syst::SystClkSource, NVIC},
};

use sh::hio;
use core::fmt::Write;

const F_CPU: MegaHertz = MegaHertz(80);

static QUEUE: Mutex<RefCell<Queue<u8, 12>>> = Mutex::new(RefCell::new(Queue::new()));

#[entry]
fn main() -> ! {
    let cp = cortex_m::Peripherals::take().unwrap();
    let dp = hal::stm32::Peripherals::take().unwrap();

    let mut flash = dp.FLASH.constrain();
    let mut rcc = dp.RCC.constrain();
    let mut pwr = dp.PWR.constrain(&mut rcc.apb1r1);

    let mut gpioa = dp.GPIOA.split(&mut rcc.ahb2);

    let mut syst = cp.SYST;

    let clocks = rcc
        .cfgr
        .sysclk(F_CPU)
        .pclk1(F_CPU)
        .pclk2(F_CPU)
        .freeze(&mut flash.acr, &mut pwr);

    syst.set_clock_source(SystClkSource::Core);
    // SysTick frequency
    syst.set_reload(clocks.sysclk().0 / 10);
    syst.clear_current();
    syst.enable_counter();
    syst.enable_interrupt();

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

    loop {}
}

#[exception]
fn SysTick() {
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

#[interrupt]
// Async USART read interrupt handler
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
