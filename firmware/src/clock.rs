use core::sync::atomic::{AtomicU32, Ordering};

static CLOCK: AtomicU32 = AtomicU32::new(0);

pub struct Clock;

impl Clock {
    pub fn get() -> u32 {
        CLOCK.load(Ordering::Relaxed)
    }

    pub fn tick() {
        CLOCK.fetch_add(1, Ordering::Relaxed);
    }
}

pub struct Counter {
    f_refresh: u32,
    last: u32,
}

impl Counter {
    pub fn new(f_refresh: u32) -> Self {
        Self {
            // In 1/ms
            f_refresh: f_refresh / 1000,
            last: 0,
        }
    }

    pub fn elapsed_ms(&mut self, ms: u32, now: u32) -> bool {
        if now.wrapping_sub(self.last) >= ms * self.f_refresh {
            self.last = now;
            return true;
        }
        false
    }

    pub fn reset(&mut self, now: u32) {
        self.last = now;
    }
}
