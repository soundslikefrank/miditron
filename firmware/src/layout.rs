pub struct Layout {
    // FIXME: definitely not flexible enough
    channels: [u8; 4],
}

impl Layout {
    pub fn new() -> Self {
        Self {
            channels: [0, 2, 2, 2],
        }
    }
    // FIXME: like this it is not possible to map one midi channel to two gates
    // Also do we need to set it independently?
    pub fn get_channel(&self, midi_channel: u8) -> Option<usize> {
        // FIXME: also not really great
        self.channels.iter().position(|c| *c == midi_channel)
    }
}
