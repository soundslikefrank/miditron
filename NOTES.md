# Project notes

* Observe that the gate output is written with a systick (0.125 ms) delay
  compared to the CV output. This ensures that the CV output will have been refreshed to the right value when the trigger/gate is sent.


## Debugging output
```rust
use core::fmt::Write;
use sh::hio;

if let Ok(mut hstdout) = hio::hstdout() {
    writeln!(hstdout, "{:?}", m).ok();
}
```

```rust
/// Receive data into a u8 buffer. See L44 RM, section 38.5.3: "Character reception procedure"
pub fn read(&mut self, buf: &mut [u8]) {
    for i in 0..buf.len() {
        // Wait for the next bit
        cfg_if! {
            if #[cfg(not(feature = "f4"))] {
                while self.regs.isr.read().rxne().bit_is_clear() {}
                buf[i] = self.regs.rdr.read().rdr().bits() as u8;
            } else {
                while self.regs.sr.read().rxne().bit_is_clear() {}
                buf[i] = self.regs.dr.read().dr().bits() as u8;
            }
        }
    }
```

```rust
#[interrupt]
/// Async USART read interrupt handler
fn USART1() {
    unsafe{ (*pac::USART1::ptr()).rqr.modify(|_, w| w.rxfrq().set_bit() }

    free(|cs| {
        let mut buf = READ_BUF.borrow(cs).borrow_mut();

        let i = READ_I.borrow(cs);

        // Could put USART struct in a mutex too.
        buf[i.get()] = unsafe{ (*pac::USART1::ptr()).dr.read().dr().bits() as u8; }
        i.set(i.get() + 1);
    });
```

```rust
// Syntax helper for getting global variables of the form `Mutex<RefCell<Option>>>` from an interrupt-free
/// context - eg in interrupt handlers.
///
/// Example: `access_global!(DELAY, delay, cs)`
#[macro_export]
macro_rules! access_global {
    ($NAME_GLOBAL:ident, $name_local:ident, $cs:expr) => {
        let mut part1 = $NAME_GLOBAL.borrow($cs).borrow_mut();
        let $name_local = part1.as_mut().unwrap();
    };
}
```

## Trigger DMA transfer from timer

https://community.st.com/s/question/0D50X0000C4MPwQ/trigger-spi-dma-transfer-from-timer-directly

## DAC Layoutes notes
As a result of the single ground pin of the DACx578, all return currents(including digital and analog return currents for the DAC) must flow through a single point. Ideally, GND would be connected directly to an analog ground plane. This plane would be separate from the ground connection for the digital components until they were connected at the power-entry point of the system.

## To adjust the chip

1*) Remove old HAL
2*) Add new HAL, adjust version and features in Cargo.yml
3) Change chip in `[package.metadata]` in Cargo.yml and in `Embed.toml`
4*) Change target in openocd.cfg
5) Adjust `.cargo/config` (`--chip xxx`) setting
6) Adjust `memory.x`
7*) Change file in .gdbinit (e.g. `thumbv7em-none-eabi` vs `thumbv7em-none-eabihf`)
8) Change the code and hope for the best

`*` = might be optional
