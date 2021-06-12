pub struct Clock(u32);

impl Clock {
    pub fn new() -> Self {
        Self(0)
    }

    pub fn get(&self) -> u32 {
        self.0
    }

    pub fn tick(&mut self) {
        self.0 = self.0.wrapping_add(1);
    }
}

pub struct Counter {
    last: u32,
    f_refresh: u32,
}

impl Counter {
    pub fn new(f_refresh: u32) -> Self {
        Self {
            last: 0,
            // In 1/ms
            f_refresh: f_refresh / 1000,
        }
    }

    pub fn elapsed_ms(&mut self, ms: u32, now: u32) -> bool {
        // TODO: this is not perfectly fine yet. We want the first call to go through immediately
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
