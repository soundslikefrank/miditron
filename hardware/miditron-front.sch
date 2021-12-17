EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 6300 2250 0    50   Input ~ 0
dac4_out_c_front
Text GLabel 6300 1350 0    50   Input ~ 0
dac8_out_c_front
Text GLabel 6300 1950 0    50   Input ~ 0
dac8_out_g_front
Text GLabel 4850 1900 0    50   Input ~ 0
gate_out_a_front
Text GLabel 4850 2100 0    50   Input ~ 0
gate_out_c_front
Text GLabel 4850 1600 0    50   Input ~ 0
run_out_front
Text GLabel 4850 1800 0    50   Input ~ 0
var_out_front
Text GLabel 6300 2350 0    50   Input ~ 0
dac4_out_b_front
Text GLabel 6300 1750 0    50   Input ~ 0
dac8_out_b_front
Text GLabel 6300 1550 0    50   Input ~ 0
dac8_out_f_front
$Comp
L Connector_Generic:Conn_01x10 J7
U 1 1 61605EB6
P 5050 1800
F 0 "J7" H 5130 1792 50  0000 L CNN
F 1 "Conn_01x10" H 5130 1701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x10_P2.54mm_Vertical" H 5050 1800 50  0001 C CNN
F 3 "~" H 5050 1800 50  0001 C CNN
	1    5050 1800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 J8
U 1 1 615F8D47
P 6500 1850
F 0 "J8" H 6580 1842 50  0000 L CNN
F 1 "Conn_01x12" H 6580 1751 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 6500 1850 50  0001 C CNN
F 3 "~" H 6500 1850 50  0001 C CNN
	1    6500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2500 3650 2500
$Comp
L power:GND #PWR08
U 1 1 6157F15E
P 3650 2500
F 0 "#PWR08" H 3650 2250 50  0001 C CNN
F 1 "GND" H 3655 2327 50  0000 C CNN
F 2 "" H 3650 2500 50  0001 C CNN
F 3 "" H 3650 2500 50  0001 C CNN
	1    3650 2500
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J6
U 1 1 614101BB
P 2700 2400
F 0 "J6" H 2750 2817 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 2750 2726 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Vertical" H 2700 2400 50  0001 C CNN
F 3 "~" H 2700 2400 50  0001 C CNN
	1    2700 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J5
U 1 1 6140E179
P 2700 1550
F 0 "J5" H 2750 1967 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 2750 1876 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x06_P2.54mm_Vertical" H 2700 1550 50  0001 C CNN
F 3 "~" H 2700 1550 50  0001 C CNN
	1    2700 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 613C18F0
P 4850 1400
F 0 "#PWR09" H 4850 1150 50  0001 C CNN
F 1 "GND" H 4855 1227 50  0000 C CNN
F 2 "" H 4850 1400 50  0001 C CNN
F 3 "" H 4850 1400 50  0001 C CNN
	1    4850 1400
	-1   0    0    1   
$EndComp
Text GLabel 3500 6350 0    50   Input ~ 0
midi_in-_front
Text GLabel 2500 2600 0    50   Input ~ 0
midi_in-_front
Text GLabel 3000 2600 2    50   Input ~ 0
midi_in+_front
Text GLabel 4850 1700 0    50   Input ~ 0
1_16_out_front
Text GLabel 4850 1500 0    50   Input ~ 0
clock_out_front
Text GLabel 4850 2200 0    50   Input ~ 0
gate_out_d_front
Text GLabel 4850 2000 0    50   Input ~ 0
gate_out_b_front
Text GLabel 6300 1850 0    50   Input ~ 0
dac8_out_h_front
Text GLabel 6300 1650 0    50   Input ~ 0
dac8_out_d_front
Text GLabel 6300 2150 0    50   Input ~ 0
dac4_out_d_front
$Comp
L power:GND #PWR010
U 1 1 611398CB
P 4850 2300
F 0 "#PWR010" H 4850 2050 50  0001 C CNN
F 1 "GND" H 4855 2127 50  0000 C CNN
F 2 "" H 4850 2300 50  0001 C CNN
F 3 "" H 4850 2300 50  0001 C CNN
	1    4850 2300
	1    0    0    -1  
$EndComp
Text GLabel 2500 2500 0    50   Input ~ 0
jack_detect_front
Text GLabel 6300 1450 0    50   Input ~ 0
dac8_out_e_front
Text GLabel 6300 2050 0    50   Input ~ 0
dac8_out_a_front
Text GLabel 6300 2450 0    50   Input ~ 0
dac4_out_a_front
Text GLabel 2500 2200 0    50   Input ~ 0
cv_in_a_front
Text GLabel 3000 2400 2    50   Input ~ 0
button_d_front
Text GLabel 3000 2300 2    50   Input ~ 0
button_b_front
Text GLabel 3000 1850 2    50   Input ~ 0
led_out_d_b_front
Text GLabel 3000 1750 2    50   Input ~ 0
led_out_d_r_front
Text GLabel 3000 1650 2    50   Input ~ 0
led_out_c_g_front
Text GLabel 3000 1550 2    50   Input ~ 0
led_out_b_b_front
Text GLabel 3000 1450 2    50   Input ~ 0
led_out_b_r_front
Text GLabel 3000 1350 2    50   Input ~ 0
led_out_a_g_front
Text GLabel 3000 2200 2    50   Input ~ 0
cv_in_b_front
Text GLabel 2500 2400 0    50   Input ~ 0
button_c_front
Text GLabel 2500 2300 0    50   Input ~ 0
button_a_front
Text GLabel 2500 1850 0    50   Input ~ 0
led_out_d_g_front
Text GLabel 2500 1750 0    50   Input ~ 0
led_out_c_b_front
Text GLabel 2500 1650 0    50   Input ~ 0
led_out_c_r_front
Text GLabel 2500 1550 0    50   Input ~ 0
led_out_b_g_front
Text GLabel 2500 1450 0    50   Input ~ 0
led_out_a_b_front
$Comp
L power:GND #PWR07
U 1 1 6113989F
P 3000 2700
F 0 "#PWR07" H 3000 2450 50  0001 C CNN
F 1 "GND" H 3005 2527 50  0000 C CNN
F 2 "" H 3000 2700 50  0001 C CNN
F 3 "" H 3000 2700 50  0001 C CNN
	1    3000 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR06
U 1 1 61139899
P 2500 2700
F 0 "#PWR06" H 2500 2550 50  0001 C CNN
F 1 "+3.3V" H 2515 2873 50  0000 C CNN
F 2 "" H 2500 2700 50  0001 C CNN
F 3 "" H 2500 2700 50  0001 C CNN
	1    2500 2700
	-1   0    0    1   
$EndComp
Text GLabel 2500 1350 0    50   Input ~ 0
led_out_a_r_front
Text GLabel 3500 6500 0    50   Input ~ 0
cv_in_a_front
Text GLabel 3500 5950 0    50   Input ~ 0
button_d_front
Text GLabel 3500 5650 0    50   Input ~ 0
button_b_front
Text GLabel 3500 5250 0    50   Input ~ 0
led_out_d_b_front
Text GLabel 3500 4950 0    50   Input ~ 0
led_out_d_r_front
Text GLabel 3500 4550 0    50   Input ~ 0
led_out_c_g_front
Text GLabel 3500 4150 0    50   Input ~ 0
led_out_b_b_front
Text GLabel 3500 3850 0    50   Input ~ 0
led_out_b_r_front
Text GLabel 3500 3450 0    50   Input ~ 0
led_out_a_g_front
Text GLabel 3500 6650 0    50   Input ~ 0
cv_in_b_front
Text GLabel 3500 6200 0    50   Input ~ 0
midi_in+_front
Text GLabel 3500 5800 0    50   Input ~ 0
button_c_front
Text GLabel 3500 5500 0    50   Input ~ 0
button_a_front
Text GLabel 3500 5100 0    50   Input ~ 0
led_out_d_g_front
Text GLabel 3500 4700 0    50   Input ~ 0
led_out_c_b_front
Text GLabel 3500 4400 0    50   Input ~ 0
led_out_c_r_front
Text GLabel 3500 4000 0    50   Input ~ 0
led_out_b_g_front
Text GLabel 3500 3600 0    50   Input ~ 0
led_out_a_b_front
Text GLabel 3500 3300 0    50   Input ~ 0
led_out_a_r_front
Text GLabel 4850 6550 2    50   Input ~ 0
1_16_out_front
Text GLabel 4850 6250 2    50   Input ~ 0
clock_out_front
Text GLabel 4850 5750 2    50   Input ~ 0
gate_out_d_front
Text GLabel 4850 5450 2    50   Input ~ 0
gate_out_b_front
Text GLabel 4850 5050 2    50   Input ~ 0
dac8_out_h_front
Text GLabel 4850 4750 2    50   Input ~ 0
dac8_out_f_front
Text GLabel 4850 4450 2    50   Input ~ 0
dac8_out_d_front
Text GLabel 4850 4150 2    50   Input ~ 0
dac8_out_b_front
Text GLabel 4850 3750 2    50   Input ~ 0
dac4_out_d_front
Text GLabel 4850 3450 2    50   Input ~ 0
dac4_out_b_front
Text GLabel 4850 6700 2    50   Input ~ 0
var_out_front
Text GLabel 4850 6400 2    50   Input ~ 0
run_out_front
Text GLabel 4850 6000 2    50   Input ~ 0
jack_detect_front
Text GLabel 4850 5600 2    50   Input ~ 0
gate_out_c_front
Text GLabel 4850 5300 2    50   Input ~ 0
gate_out_a_front
Text GLabel 4850 4900 2    50   Input ~ 0
dac8_out_g_front
Text GLabel 4850 4600 2    50   Input ~ 0
dac8_out_e_front
Text GLabel 4850 4300 2    50   Input ~ 0
dac8_out_c_front
Text GLabel 4850 4000 2    50   Input ~ 0
dac8_out_a_front
Text GLabel 4850 3600 2    50   Input ~ 0
dac4_out_c_front
Text GLabel 4850 3300 2    50   Input ~ 0
dac4_out_a_front
$Sheet
S 3500 3150 1350 3700
U 61006ED6
F0 "front" 50
F1 "midi2cv-front.sch" 50
F2 "led_out_a_g" I L 3500 3450 50 
F3 "led_out_a_b" I L 3500 3600 50 
F4 "led_out_a_r" I L 3500 3300 50 
F5 "led_out_d_r" I L 3500 4950 50 
F6 "led_out_d_b" I L 3500 5250 50 
F7 "led_out_d_g" I L 3500 5100 50 
F8 "led_out_c_r" I L 3500 4400 50 
F9 "led_out_c_b" I L 3500 4700 50 
F10 "led_out_c_g" I L 3500 4550 50 
F11 "led_out_b_r" I L 3500 3850 50 
F12 "led_out_b_b" I L 3500 4150 50 
F13 "led_out_b_g" I L 3500 4000 50 
F14 "jack_detect" I R 4850 6000 50 
F15 "cv_in_a" O L 3500 6500 50 
F16 "cv_in_b" O L 3500 6650 50 
F17 "clock_out" I R 4850 6250 50 
F18 "run_out" I R 4850 6400 50 
F19 "1_16_out" I R 4850 6550 50 
F20 "var_out" I R 4850 6700 50 
F21 "dac4_out_a" I R 4850 3300 50 
F22 "dac4_out_b" I R 4850 3450 50 
F23 "dac4_out_c" I R 4850 3600 50 
F24 "dac4_out_d" I R 4850 3750 50 
F25 "gate_out_a" I R 4850 5300 50 
F26 "gate_out_b" I R 4850 5450 50 
F27 "gate_out_c" I R 4850 5600 50 
F28 "gate_out_d" I R 4850 5750 50 
F29 "dac8_out_a" I R 4850 4000 50 
F30 "dac8_out_b" I R 4850 4150 50 
F31 "dac8_out_c" I R 4850 4300 50 
F32 "dac8_out_d" I R 4850 4450 50 
F33 "dac8_out_e" I R 4850 4600 50 
F34 "dac8_out_f" I R 4850 4750 50 
F35 "dac8_out_g" I R 4850 4900 50 
F36 "dac8_out_h" I R 4850 5050 50 
F37 "button_a" O L 3500 5500 50 
F38 "button_b" O L 3500 5650 50 
F39 "button_d" O L 3500 5950 50 
F40 "button_c" O L 3500 5800 50 
F41 "midi_in+" O L 3500 6200 50 
F42 "midi_in-" O L 3500 6350 50 
$EndSheet
$EndSCHEMATC
