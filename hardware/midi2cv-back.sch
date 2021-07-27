EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8500 2200 1250 800 
U 60A48B70
F0 "DAC8564" 50
F1 "dac4.sch" 50
F2 "dac4_din" I L 8500 2450 50 
F3 "dac4_clk" I L 8500 2600 50 
F4 "dac4_cs" I L 8500 2750 50 
$EndSheet
$Sheet
S 8500 3950 1250 800 
U 60A5BF82
F0 "DAC5578" 50
F1 "dac8.sch" 50
F2 "dac8_scl" B L 8500 4250 50 
F3 "dac8_sda" B L 8500 4450 50 
$EndSheet
$Comp
L power:GND #PWR?
U 1 1 60A4D09B
P 2350 4850
F 0 "#PWR?" H 2350 4600 50  0001 C CNN
F 1 "GND" H 2355 4677 50  0000 C CNN
F 2 "" H 2350 4850 50  0001 C CNN
F 3 "" H 2350 4850 50  0001 C CNN
	1    2350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4200 1950 4300
Wire Wire Line
	1950 4700 2350 4700
Wire Wire Line
	2350 4700 2350 4600
Connection ~ 1950 4300
Wire Wire Line
	1950 4300 1950 4400
Connection ~ 1950 4400
Wire Wire Line
	1950 4400 1950 4700
Wire Wire Line
	2350 4700 2350 4850
Connection ~ 2350 4700
Wire Wire Line
	2350 4700 2750 4700
Wire Wire Line
	2750 4700 2750 4400
$Comp
L power:+3.3V #PWR?
U 1 1 60A52E41
P 2350 4000
F 0 "#PWR?" H 2350 3850 50  0001 C CNN
F 1 "+3.3V" H 2365 4173 50  0000 C CNN
F 2 "" H 2350 4000 50  0001 C CNN
F 3 "" H 2350 4000 50  0001 C CNN
	1    2350 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4200 3400 4200
Wire Wire Line
	2750 4300 3400 4300
$Comp
L power:+3.3V #PWR?
U 1 1 60A58EE0
P 1450 4050
F 0 "#PWR?" H 1450 3900 50  0001 C CNN
F 1 "+3.3V" H 1465 4223 50  0000 C CNN
F 2 "" H 1450 4050 50  0001 C CNN
F 3 "" H 1450 4050 50  0001 C CNN
	1    1450 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A592F0
P 1450 4350
F 0 "#PWR?" H 1450 4100 50  0001 C CNN
F 1 "GND" H 1455 4177 50  0000 C CNN
F 2 "" H 1450 4350 50  0001 C CNN
F 3 "" H 1450 4350 50  0001 C CNN
	1    1450 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60A598C4
P 1450 4200
F 0 "C?" H 1565 4246 50  0000 L CNN
F 1 "100n" H 1565 4155 50  0000 L CNN
F 2 "" H 1488 4050 50  0001 C CNN
F 3 "~" H 1450 4200 50  0001 C CNN
	1    1450 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60A5CF6A
P 5550 1600
F 0 "#PWR?" H 5550 1450 50  0001 C CNN
F 1 "+3.3V" H 5565 1773 50  0000 C CNN
F 2 "" H 5550 1600 50  0001 C CNN
F 3 "" H 5550 1600 50  0001 C CNN
	1    5550 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5300 5450 5500
$Comp
L Memory_EEPROM:CAT24C256 U?
U 1 1 60A44E16
P 2350 4300
F 0 "U?" H 1950 4700 50  0000 C CNN
F 1 "AT24C256C" H 1950 4600 50  0000 C CNN
F 2 "" H 2350 4300 50  0001 C CNN
F 3 "https://www.onsemi.cn/PowerSolutions/document/CAT24C256-D.PDF" H 2350 4300 50  0001 C CNN
	1    2350 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5300 5350 5500
Wire Wire Line
	5350 5500 5450 5500
Wire Wire Line
	5550 5500 5550 5300
Connection ~ 5450 5500
Wire Wire Line
	5550 5500 5650 5500
Wire Wire Line
	5650 5500 5650 5300
Connection ~ 5550 5500
$Comp
L power:GND #PWR?
U 1 1 60A664FC
P 5550 5600
F 0 "#PWR?" H 5550 5350 50  0001 C CNN
F 1 "GND" H 5555 5427 50  0000 C CNN
F 2 "" H 5550 5600 50  0001 C CNN
F 3 "" H 5550 5600 50  0001 C CNN
	1    5550 5600
	1    0    0    -1  
$EndComp
Text GLabel 3700 3650 2    50   Input ~ 0
spi1_sck
Text GLabel 8500 2600 0    50   Input ~ 0
spi1_sck
Text GLabel 3700 3550 2    50   Input ~ 0
spi1_nss
Text GLabel 8500 2750 0    50   Input ~ 0
spi1_nss
Text GLabel 3700 3850 2    50   Input ~ 0
spi1_mosi
Text GLabel 8500 2450 0    50   Input ~ 0
spi1_mosi
Text GLabel 4100 3000 0    50   Input ~ 0
i2c2_scl
Text GLabel 4100 3100 0    50   Input ~ 0
i2c2_sda
Text GLabel 8500 4250 0    50   Input ~ 0
i2c2_scl
Text GLabel 8500 4450 0    50   Input ~ 0
i2c2_sda
Wire Wire Line
	5650 5500 5750 5500
Wire Wire Line
	5750 5500 5750 5300
Connection ~ 5650 5500
Wire Wire Line
	5450 5500 5550 5500
Wire Wire Line
	5550 5500 5550 5600
$Comp
L MCU_ST_STM32F4:STM32F401RBTx U?
U 1 1 6100D1FD
P 5550 3500
F 0 "U?" H 6250 5300 50  0000 C CNN
F 1 "STM32F401RBTx" H 6250 5200 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 4950 1800 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00086815.pdf" H 5550 3500 50  0001 C CNN
	1    5550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1600 5550 1700
Wire Wire Line
	5550 1700 5650 1700
Wire Wire Line
	5650 1700 5650 1800
Connection ~ 5550 1700
Wire Wire Line
	5550 1700 5550 1800
Wire Wire Line
	5650 1700 5750 1700
Wire Wire Line
	5750 1700 5750 1800
Connection ~ 5650 1700
Wire Wire Line
	5550 1700 5450 1700
Wire Wire Line
	5450 1700 5450 1800
Wire Wire Line
	5450 1700 5350 1700
Wire Wire Line
	5350 1700 5350 1800
Connection ~ 5450 1700
$EndSCHEMATC
