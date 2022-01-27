pub struct Layout {
    // FIXME: definitely not flexible enough
    channels: [u8; 4],
}

impl Layout {
    pub fn new() -> Self {
        Self {
            channels: [0, 0, 2, 2],
        }
    }
    // FIXME: like this it is not possible to map one midi channel to two gates
    // Also do we need to set it independently?
    pub fn get_channel(&self, midi_channel: u8) -> Option<usize> {
        // FIXME: also not really great
        // self.channels.iter().position(|c| *c == midi_channel)
        // FIXME: this is just for testing purposes
        Some(midi_channel as usize)
    }
    pub fn get_mod_from_cc(&self, channel: u8, cc: u8) -> Option<usize> {
        if let Some(chan) = self.get_channel(channel) {
            return Some(chan * 2 + cc as usize);
        }
        None
    }
}
