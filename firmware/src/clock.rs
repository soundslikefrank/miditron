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
