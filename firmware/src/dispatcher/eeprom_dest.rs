use heapless::Vec;

use crate::clock::Counter;

// Allows for a maximum of 5 pages to be written (32 bytes p.p.). Increase for more
const MAX_BUFFER_SIZE: usize = 5 * 32;

pub struct EepromDestination {
    counter: Counter,
    current_page: usize,
    data: Vec<u8, MAX_BUFFER_SIZE>,
    last_page: usize,
}

impl EepromDestination {
    pub fn new(f_refresh: u32) -> Self {
        Self {
            counter: Counter::new(f_refresh),
            current_page: 0,
            data: Vec::new(),
            last_page: 0,
        }
    }

    pub fn set(&mut self, start_page: usize, data: &[u8], now: u32) {
        if data.len() > MAX_BUFFER_SIZE {
            panic!("Buffer to store is too big. Max is {}", MAX_BUFFER_SIZE)
        }
        self.counter.reset(now);
        self.data.clear();
        self.data.extend_from_slice(data).unwrap();
        let mut size = data.len();
        // Make size divisible by 32
        if size % 32 != 0 {
            size = (size / 32 + 1) * 32;
            self.data.resize_default(size).unwrap();
        }
        self.current_page = start_page;
        self.last_page = start_page + size / 32;
    }

    pub fn next(&mut self, now: u32) -> Option<(usize, [u8; 32])> {
        if self.current_page < self.last_page && self.counter.elapsed_ms(5, now) {
            let buf = self
                .data
                .chunks_exact(32)
                .nth_back(self.last_page - self.current_page - 1)
                .unwrap();
            let page = self.current_page;
            self.current_page += 1;
            let mut res: [u8; 32] = [0; 32];
            res.copy_from_slice(buf);
            return Some((page, res));
        }
        None
    }
}
