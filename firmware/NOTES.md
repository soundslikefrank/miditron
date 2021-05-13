# Project notes

* Observe that the gate output is written with a systick (0.125 ms) delay
  compared to the CV output. This ensures that the CV output will have been refreshed to the right value when the trigger/gate is sent.


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
