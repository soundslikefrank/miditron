EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L DAC5578SPWR:DAC5578SPWR IC?
U 1 1 60A5C8AD
P 5100 3400
F 0 "IC?" H 5950 3665 50  0000 C CNN
F 1 "DAC5578SPWR" H 5950 3574 50  0000 C CNN
F 2 "SOP65P640X120-16N" H 6650 3500 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/DAC5578" H 6650 3400 50  0001 L CNN
F 4 "8-bit, Octal Channel, Ultra-Low Glitch, Voltage Output, 2-Wire Interface DAC" H 6650 3300 50  0001 L CNN "Description"
F 5 "" H 6650 3200 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 6650 3100 50  0001 L CNN "Manufacturer_Name"
F 7 "DAC5578SPWR" H 6650 3000 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-DAC5578SPWR" H 6650 2900 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/DAC5578SPWR?qs=EuM%2FBx4ov4S16BMU6rn1hg%3D%3D" H 6650 2800 50  0001 L CNN "Mouser Price/Stock"
F 10 "DAC5578SPWR" H 6650 2700 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/dac5578spwr/texas-instruments" H 6650 2600 50  0001 L CNN "Arrow Price/Stock"
	1    5100 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR?
U 1 1 60A63ABE
P 5950 1400
AR Path="/60A48B70/60A63ABE" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A63ABE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5950 1250 50  0001 C CNN
F 1 "+3.3VA" H 5965 1573 50  0000 C CNN
F 2 "" H 5950 1400 50  0001 C CNN
F 3 "" H 5950 1400 50  0001 C CNN
	1    5950 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A63ACA
P 5950 1900
AR Path="/60A48B70/60A63ACA" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A63ACA" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5950 1650 50  0001 C CNN
F 1 "GND" H 5955 1727 50  0000 C CNN
F 2 "" H 5950 1900 50  0001 C CNN
F 3 "" H 5950 1900 50  0001 C CNN
	1    5950 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60A63AD0
P 6150 1650
AR Path="/60A48B70/60A63AD0" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60A63AD0" Ref="C?"  Part="1" 
F 0 "C?" H 6265 1696 50  0000 L CNN
F 1 "3.3u" H 6265 1605 50  0000 L CNN
F 2 "" H 6188 1500 50  0001 C CNN
F 3 "~" H 6150 1650 50  0001 C CNN
	1    6150 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60A63AD6
P 5750 1650
AR Path="/60A48B70/60A63AD6" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60A63AD6" Ref="C?"  Part="1" 
F 0 "C?" H 5635 1604 50  0000 R CNN
F 1 "100n" H 5635 1695 50  0000 R CNN
F 2 "" H 5788 1500 50  0001 C CNN
F 3 "~" H 5750 1650 50  0001 C CNN
	1    5750 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	5950 1400 5750 1400
Wire Wire Line
	5750 1400 5750 1500
Wire Wire Line
	5950 1400 6150 1400
Wire Wire Line
	6150 1400 6150 1500
Connection ~ 5950 1400
Wire Wire Line
	5950 1900 6150 1900
Wire Wire Line
	6150 1900 6150 1800
Wire Wire Line
	5950 1900 5750 1900
Wire Wire Line
	5750 1900 5750 1800
Connection ~ 5950 1900
Text GLabel 5100 4100 0    50   Input ~ 0
v_ref_dac
$Comp
L power:+3.3VA #PWR?
U 1 1 60A68DBC
P 4600 3600
F 0 "#PWR?" H 4600 3450 50  0001 C CNN
F 1 "+3.3VA" V 4615 3727 50  0000 L CNN
F 2 "" H 4600 3600 50  0001 C CNN
F 3 "" H 4600 3600 50  0001 C CNN
	1    4600 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4600 3600 5100 3600
Wire Wire Line
	5100 3500 4950 3500
Wire Wire Line
	4950 3400 5100 3400
Wire Wire Line
	4800 3400 4950 3400
Connection ~ 4950 3400
Wire Wire Line
	4950 3500 4950 3400
$Comp
L power:GND #PWR?
U 1 1 60A68DC3
P 4800 3400
AR Path="/60A48B70/60A68DC3" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A68DC3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4800 3150 50  0001 C CNN
F 1 "GND" V 4805 3272 50  0000 R CNN
F 2 "" H 4800 3400 50  0001 C CNN
F 3 "" H 4800 3400 50  0001 C CNN
	1    4800 3400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A6D04A
P 7250 3600
AR Path="/60A48B70/60A6D04A" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A6D04A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7250 3350 50  0001 C CNN
F 1 "GND" V 7255 3472 50  0000 R CNN
F 2 "" H 7250 3600 50  0001 C CNN
F 3 "" H 7250 3600 50  0001 C CNN
	1    7250 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60A6DE0B
P 6900 4500
AR Path="/60A48B70/60A6DE0B" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A6DE0B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6900 4350 50  0001 C CNN
F 1 "+3.3V" H 6915 4673 50  0000 C CNN
F 2 "" H 6900 4500 50  0001 C CNN
F 3 "" H 6900 4500 50  0001 C CNN
	1    6900 4500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 60A6F434
P 6900 4350
F 0 "R?" H 6830 4304 50  0000 R CNN
F 1 "10k" H 6830 4395 50  0000 R CNN
F 2 "" V 6830 4350 50  0001 C CNN
F 3 "~" H 6900 4350 50  0001 C CNN
	1    6900 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	6800 4100 6900 4100
Wire Wire Line
	6900 4100 6900 4200
Text HLabel 6800 3400 2    50   BiDi ~ 0
dac8_scl
Text HLabel 6800 3500 2    50   BiDi ~ 0
dac8_sda
Wire Wire Line
	6800 3600 7250 3600
$EndSCHEMATC
