# Hardware design

## Parts

### MCU

* STM32F410xx (most basic one of the F4 series)

### DACs

* DAC8564 (4-channel 16 bit DAC, precise and fast)
* DAC5578 (8-channel 8 bit DAC for modulation - midi only has 7 bit values)

### Power supply

* 5V (tbd, do we need something juicy - probably not)
* 3.3V (LD117-3.3? - we'll find something)
* 3.3VA - ADP150 -> Powers both DACs

### Buttons/LEDs

* TC002-N11AS1XT-RGB RGB LED buttons
* LP5012PWR LED driver

### Amps

* OPA4172 for DAC8564
* TL074 for each row of mod output
* SN74AHCT1G125 (single) or SN74AHCT244 (octal) buffers for triggers

### Memory

* AT24C256C-SSHL-T 256kbit EEPROM

## PCB layout notes

### DAC layout
As a result of the single ground pin of the DACx578, all return currents(including digital and analog return currents for the DAC) must flow through a single point. Ideally, GND would be connected directly to an analog ground plane. This plane would be separate from the ground connection for the digital components until they were connected at the power-entry point of the system.

