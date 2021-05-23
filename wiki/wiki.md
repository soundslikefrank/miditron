# Midi2CV project wiki

* [todos](TODOs)
* [resources](resources)
* [rust_embedded](rust_embedded)
* [hardware_design](hardware_design)

## Feature list (tentative)

* Out/Inputs
  - 4 V/oct outputs (high precision DACs)
  - 4 Trigger outputs
  - 8 Modulation outputs (low precision DAC - 8bit)
  - 1 Clock out
  - 1 Run out
  - 1 1/16 out
  - 1 General CV IN (YES, IN)

* Different layouts
  - Per channel mod (default)
    ->  1V/oct + 1 Trigger + 2 Modulation outputs per channel
  - Bottom two rows can be assigned to be any of these (only full row assignment?)
    -> Per channel modulation (see above)
    -> Send Controller Change messages (one row is one channel)
    -> Send velocity sensitive gates/triggers (per channel)

* Per channel features
  - Learn
    -> Learn the channel by long pressing on the button and then hitting a note
  - Arpeggiator
    -> Just standard stuff, cycle (direction), octaves

* CV in
  - Potential modulation destinations:
    -> Arp speed (when there is no midi clock source)
    -> Arp settings
    -> Idea: when there is no clock it's for speed, when there is a clock we can
      use it for something else

* Expander outputs (tentative)
  - I2C (to combine units)
  - Midi out/through?

* Save all the settings where you left off after power down

* Settings via SysEx (v2)

## Random ideas

* Differently colored LED depending on signal (e.g. NoteOn has a different color
  than CC, modwheel, breath, whatever).