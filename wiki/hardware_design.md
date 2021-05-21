# Hardware design

## Power supply

* 5V (tbd, do we need something juicy - probably not)
* 3.3V (LD117-3.3? - we'll find something)
* 3.3VA - ADP150 -> Powers both DACs

## Buttons/LEDs

* TC002-N11AS1XT-RGB RGB LED buttons
* LP5012PWR LED driver

## PCB layout notes

### DAC layout
As a result of the single ground pin of the DACx578, all return currents(including digital and analog return currents for the DAC) must flow through a single point. Ideally, GND would be connected directly to an analog ground plane. This plane would be separate from the ground connection for the digital components until they were connected at the power-entry point of the system.

