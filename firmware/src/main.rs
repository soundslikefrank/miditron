//! Test the serial interface using an interrupt
//!
#![no_main]
#![no_std]

extern crate cortex_m;
#[macro_use(entry, exception)]
extern crate cortex_m_rt as rt;
// #[macro_use(block)]
extern crate cortex_m_semihosting as sh;
extern crate nb;
extern crate panic_semihosting;

extern crate stm32l4xx_hal as hal;

use core::cell::{Cell, RefCell};

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

const BUF_SIZE: usize = 10;

// Set up an output pin in a globally-accessible mutex.
static READ_BUF: Mutex<RefCell<[u8; BUF_SIZE]>> = Mutex::new(RefCell::new([0; BUF_SIZE]));
static READ_I: Mutex<Cell<usize>> = Mutex::new(Cell::new(0));

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

    loop {
        timer.delay_ms(1000_u32);
        let size = free(|cs| {
            let i = READ_I.borrow(cs);
            i.get()
        });
        if let Ok(mut hstdout) = hio::hstdout() {
            // Q: We don't really care if that's not working, is `ok()` fine here?
            writeln!(hstdout, "{}", size).ok();
        }
    }
}

#[interrupt]
/// Async USART read interrupt handler
fn USART1() {
    unsafe { (*pac::USART1::ptr()).rqr.write(|w| w.rxfrq().set_bit()) }

    free(|cs| {
        let i = READ_I.borrow(cs);
        let i_val = i.get();
        if i_val == BUF_SIZE {
            return;
        }

        let mut buf = READ_BUF.borrow(cs).borrow_mut();

        buf[i_val] = unsafe { (*pac::USART1::ptr()).rdr.read().bits() } as u8;
        i.set(i_val + 1);
    });
}

#[exception]
fn HardFault(ef: &ExceptionFrame) -> ! {
    panic!("{:#?}", ef);
}
