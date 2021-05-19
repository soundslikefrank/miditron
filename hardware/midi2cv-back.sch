EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
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
P 4250 4750
F 0 "#PWR?" H 4250 4500 50  0001 C CNN
F 1 "GND" H 4255 4577 50  0000 C CNN
F 2 "" H 4250 4750 50  0001 C CNN
F 3 "" H 4250 4750 50  0001 C CNN
	1    4250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4100 3850 4200
Wire Wire Line
	3850 4600 4250 4600
Wire Wire Line
	4250 4600 4250 4500
Connection ~ 3850 4200
Wire Wire Line
	3850 4200 3850 4300
Connection ~ 3850 4300
Wire Wire Line
	3850 4300 3850 4600
Wire Wire Line
	4250 4600 4250 4750
Connection ~ 4250 4600
Wire Wire Line
	4250 4600 4650 4600
Wire Wire Line
	4650 4600 4650 4300
$Comp
L power:+3.3V #PWR?
U 1 1 60A52E41
P 4250 3900
F 0 "#PWR?" H 4250 3750 50  0001 C CNN
F 1 "+3.3V" H 4265 4073 50  0000 C CNN
F 2 "" H 4250 3900 50  0001 C CNN
F 3 "" H 4250 3900 50  0001 C CNN
	1    4250 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4100 5300 4100
Wire Wire Line
	4650 4200 5300 4200
$Comp
L power:+3.3V #PWR?
U 1 1 60A58EE0
P 3350 3950
F 0 "#PWR?" H 3350 3800 50  0001 C CNN
F 1 "+3.3V" H 3365 4123 50  0000 C CNN
F 2 "" H 3350 3950 50  0001 C CNN
F 3 "" H 3350 3950 50  0001 C CNN
	1    3350 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A592F0
P 3350 4250
F 0 "#PWR?" H 3350 4000 50  0001 C CNN
F 1 "GND" H 3355 4077 50  0000 C CNN
F 2 "" H 3350 4250 50  0001 C CNN
F 3 "" H 3350 4250 50  0001 C CNN
	1    3350 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60A598C4
P 3350 4100
F 0 "C?" H 3465 4146 50  0000 L CNN
F 1 "100n" H 3465 4055 50  0000 L CNN
F 2 "" H 3388 3950 50  0001 C CNN
F 3 "~" H 3350 4100 50  0001 C CNN
	1    3350 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60A5CF6A
P 6000 1800
F 0 "#PWR?" H 6000 1650 50  0001 C CNN
F 1 "+3.3V" H 6015 1973 50  0000 C CNN
F 2 "" H 6000 1800 50  0001 C CNN
F 3 "" H 6000 1800 50  0001 C CNN
	1    6000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1800 6000 1900
Wire Wire Line
	5800 2100 5800 1900
Wire Wire Line
	5800 1900 5900 1900
Connection ~ 6000 1900
Wire Wire Line
	6000 1900 6000 2100
Wire Wire Line
	5900 2100 5900 1900
Connection ~ 5900 1900
Wire Wire Line
	5900 1900 6000 1900
Wire Wire Line
	6100 2100 6100 1900
Wire Wire Line
	6100 1900 6000 1900
Wire Wire Line
	6200 2100 6200 1900
Wire Wire Line
	6200 1900 6100 1900
Connection ~ 6100 1900
Wire Wire Line
	5900 5100 5900 5300
$Comp
L Memory_EEPROM:CAT24C256 U?
U 1 1 60A44E16
P 4250 4200
F 0 "U?" H 3850 4600 50  0000 C CNN
F 1 "AT24C256C" H 3850 4500 50  0000 C CNN
F 2 "" H 4250 4200 50  0001 C CNN
F 3 "https://www.onsemi.cn/PowerSolutions/document/CAT24C256-D.PDF" H 4250 4200 50  0001 C CNN
	1    4250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 5100 5800 5300
Wire Wire Line
	5800 5300 5900 5300
Wire Wire Line
	6000 5300 6000 5100
Connection ~ 5900 5300
Wire Wire Line
	6000 5300 6100 5300
Wire Wire Line
	6100 5300 6100 5100
Connection ~ 6000 5300
$Comp
L MCU_ST_STM32F1:STM32F103C8Tx U?
U 1 1 60A44151
P 6000 3600
F 0 "U?" H 6550 2050 50  0000 C CNN
F 1 "STM32F103C8Tx" H 6550 1950 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 5400 2200 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/CD00161566.pdf" H 6000 3600 50  0001 C CNN
	1    6000 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A664FC
P 5950 5400
F 0 "#PWR?" H 5950 5150 50  0001 C CNN
F 1 "GND" H 5955 5227 50  0000 C CNN
F 2 "" H 5950 5400 50  0001 C CNN
F 3 "" H 5950 5400 50  0001 C CNN
	1    5950 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5300 5950 5300
Wire Wire Line
	5950 5300 5950 5400
Connection ~ 5950 5300
Wire Wire Line
	5950 5300 6000 5300
Text GLabel 6600 3900 2    50   Input ~ 0
spi1_sck
Text GLabel 8500 2600 0    50   Input ~ 0
spi1_sck
Text GLabel 6600 3800 2    50   Input ~ 0
spi1_nss
Text GLabel 8500 2750 0    50   Input ~ 0
spi1_nss
Text GLabel 6600 4100 2    50   Input ~ 0
spi1_mosi
Text GLabel 8500 2450 0    50   Input ~ 0
spi1_mosi
Text GLabel 5300 4400 0    50   Input ~ 0
i2c2_scl
Text GLabel 5300 4500 0    50   Input ~ 0
i2c2_sda
Text GLabel 8500 4250 0    50   Input ~ 0
i2c2_scl
Text GLabel 8500 4450 0    50   Input ~ 0
i2c2_sda
$EndSCHEMATC
