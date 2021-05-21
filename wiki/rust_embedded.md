# Rust / Embedded random notes

## To adjust the chip/HAL

1*) Remove old HAL
2*) Add new HAL, adjust version and features in Cargo.yml
3) Change chip in `[package.metadata]` in Cargo.yml and in `Embed.toml`
4*) Change target in openocd.cfg
5) Adjust `.cargo/config` (`--chip xxx`) setting
6) Adjust `memory.x`
7*) Change file in .gdbinit (e.g. `thumbv7em-none-eabi` vs `thumbv7em-none-eabihf`)
8) Change the code and hope for the best

`*` = might be optional

## Trigger DMA transfer from timer

https://community.st.com/s/question/0D50X0000C4MPwQ/trigger-spi-dma-transfer-from-timer-directly

## Snippets

#### Syntax helper for getting global variables of the form `Mutex<RefCell<Option>>>` from an interrupt-free
```rust
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

#### Debugging output
```rust
use core::fmt::Write;
use sh::hio;

if let Ok(mut hstdout) = hio::hstdout() {
    writeln!(hstdout, "{:?}", m).ok();
}
```

