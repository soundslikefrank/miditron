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
    -> Mode where you can use all 8 mod sources for one channel

* Per channel features
  - Learn
    -> Learn the channel by long pressing on the button and then hitting a note
  - Arpeggiator with four settings (v2?)
    -> Cycle (direction)
    -> Octaves
    -> Clock division
    -> Note length

* CV in
  - Default CV1 is BPM speed (indicator with colors of LEDs) - One button can be
    run / stop button
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
* React to MIDI CC messages to change settings (see also [here](https://docs.google.com/spreadsheets/u/0/d/15TJX1dSbiRo1jPDxPYR4GV2ICQuVu5B6wAjiAAwP60o/pub?gid=1))

## Specs

* Velocity sensitive gates probably need to be between 0 and 5 volts
  - DAC8 range from -5 to 5 volts nominal?
  - DAC4 range from 0 - 8 volts nominal?

## Random ideas

* Tap tempo
* Differently colored LED depending on signal (e.g. NoteOn has a different color
  than CC, modwheel, breath, whatever).

