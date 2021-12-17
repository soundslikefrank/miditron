EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
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
S 2950 3050 1350 3700
U 61005BD4
F0 "back" 50
F1 "midi2cv-back.sch" 50
F2 "led_out_a_r" O L 2950 3200 50 
F3 "led_out_d_b" O L 2950 5150 50 
F4 "led_out_d_g" O L 2950 5000 50 
F5 "led_out_d_r" O L 2950 4850 50 
F6 "led_out_c_b" O L 2950 4600 50 
F7 "led_out_c_g" O L 2950 4450 50 
F8 "led_out_c_r" O L 2950 4300 50 
F9 "led_out_b_b" O L 2950 4050 50 
F10 "led_out_b_g" O L 2950 3900 50 
F11 "led_out_b_r" O L 2950 3750 50 
F12 "led_out_a_b" O L 2950 3500 50 
F13 "led_out_a_g" O L 2950 3350 50 
F14 "dac4_out_a" O R 4300 3200 50 
F15 "dac4_out_b" O R 4300 3350 50 
F16 "dac4_out_c" O R 4300 3500 50 
F17 "dac4_out_d" O R 4300 3650 50 
F18 "dac8_out_a" O R 4300 3900 50 
F19 "dac8_out_b" O R 4300 4050 50 
F20 "dac8_out_c" O R 4300 4200 50 
F21 "dac8_out_d" O R 4300 4350 50 
F22 "dac8_out_e" O R 4300 4500 50 
F23 "dac8_out_f" O R 4300 4650 50 
F24 "dac8_out_g" O R 4300 4800 50 
F25 "dac8_out_h" O R 4300 4950 50 
F26 "midi_in+" I L 2950 6100 50 
F27 "button_a" I L 2950 5400 50 
F28 "button_b" I L 2950 5550 50 
F29 "button_c" I L 2950 5700 50 
F30 "button_d" I L 2950 5850 50 
F31 "jack_detect" O R 4300 5900 50 
F32 "gate_out_a" O R 4300 5200 50 
F33 "clock_out" O R 4300 6150 50 
F34 "run_out" O R 4300 6300 50 
F35 "1_16_out" O R 4300 6450 50 
F36 "gate_out_b" O R 4300 5350 50 
F37 "gate_out_c" O R 4300 5500 50 
F38 "gate_out_d" O R 4300 5650 50 
F39 "var_out" O R 4300 6600 50 
F40 "cv_jack_a" I L 2950 6400 50 
F41 "cv_jack_b" I L 2950 6550 50 
F42 "midi_in-" I L 2950 6250 50 
$EndSheet
Text GLabel 1950 1250 0    50   Input ~ 0
led_out_a_r_back
$Comp
L power:+3.3V #PWR01
U 1 1 610CBBFD
P 1950 2600
F 0 "#PWR01" H 1950 2450 50  0001 C CNN
F 1 "+3.3V" H 1965 2773 50  0000 C CNN
F 2 "" H 1950 2600 50  0001 C CNN
F 3 "" H 1950 2600 50  0001 C CNN
	1    1950 2600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 610CD2D7
P 2450 2600
F 0 "#PWR02" H 2450 2350 50  0001 C CNN
F 1 "GND" H 2455 2427 50  0000 C CNN
F 2 "" H 2450 2600 50  0001 C CNN
F 3 "" H 2450 2600 50  0001 C CNN
	1    2450 2600
	1    0    0    -1  
$EndComp
Text GLabel 1950 1350 0    50   Input ~ 0
led_out_a_b_back
Text GLabel 1950 1450 0    50   Input ~ 0
led_out_b_g_back
Text GLabel 1950 1550 0    50   Input ~ 0
led_out_c_r_back
Text GLabel 1950 1650 0    50   Input ~ 0
led_out_c_b_back
Text GLabel 1950 1750 0    50   Input ~ 0
led_out_d_g_back
Text GLabel 1950 2200 0    50   Input ~ 0
button_a_back
Text GLabel 1950 2300 0    50   Input ~ 0
button_c_back
Text GLabel 2450 2500 2    50   Input ~ 0
midi_in+_back
Text GLabel 2450 2100 2    50   Input ~ 0
cv_in_b_back
Text GLabel 2450 1250 2    50   Input ~ 0
led_out_a_g_back
Text GLabel 2450 1350 2    50   Input ~ 0
led_out_b_r_back
Text GLabel 2450 1450 2    50   Input ~ 0
led_out_b_b_back
Text GLabel 2450 1550 2    50   Input ~ 0
led_out_c_g_back
Text GLabel 2450 1650 2    50   Input ~ 0
led_out_d_r_back
Text GLabel 2450 1750 2    50   Input ~ 0
led_out_d_b_back
Text GLabel 2450 2200 2    50   Input ~ 0
button_b_back
Text GLabel 2450 2300 2    50   Input ~ 0
button_d_back
Text GLabel 1950 2100 0    50   Input ~ 0
cv_in_a_back
Text GLabel 4150 1850 0    50   Input ~ 0
gate_out_a_back
Text GLabel 4150 2050 0    50   Input ~ 0
gate_out_c_back
Text GLabel 1950 2400 0    50   Input ~ 0
jack_detect_back
Text GLabel 4150 1550 0    50   Input ~ 0
run_out_back
Text GLabel 4150 1750 0    50   Input ~ 0
var_out_back
$Comp
L power:GND #PWR04
U 1 1 610D386F
P 4150 1350
F 0 "#PWR04" H 4150 1100 50  0001 C CNN
F 1 "GND" H 4155 1177 50  0000 C CNN
F 2 "" H 4150 1350 50  0001 C CNN
F 3 "" H 4150 1350 50  0001 C CNN
	1    4150 1350
	-1   0    0    1   
$EndComp
Text GLabel 4150 1950 0    50   Input ~ 0
gate_out_b_back
Text GLabel 4150 2150 0    50   Input ~ 0
gate_out_d_back
Text GLabel 4150 1450 0    50   Input ~ 0
clock_out_back
Text GLabel 4150 1650 0    50   Input ~ 0
1_16_out_back
Text GLabel 2950 3200 0    50   Input ~ 0
led_out_a_r_back
Text GLabel 2950 3500 0    50   Input ~ 0
led_out_a_b_back
Text GLabel 2950 3900 0    50   Input ~ 0
led_out_b_g_back
Text GLabel 2950 4300 0    50   Input ~ 0
led_out_c_r_back
Text GLabel 2950 4600 0    50   Input ~ 0
led_out_c_b_back
Text GLabel 2950 5000 0    50   Input ~ 0
led_out_d_g_back
Text GLabel 2950 5400 0    50   Input ~ 0
button_a_back
Text GLabel 2950 5700 0    50   Input ~ 0
button_c_back
Text GLabel 2950 6100 0    50   Input ~ 0
midi_in+_back
Text GLabel 2950 6550 0    50   Input ~ 0
cv_in_b_back
Text GLabel 2950 3350 0    50   Input ~ 0
led_out_a_g_back
Text GLabel 2950 3750 0    50   Input ~ 0
led_out_b_r_back
Text GLabel 2950 4050 0    50   Input ~ 0
led_out_b_b_back
Text GLabel 2950 4450 0    50   Input ~ 0
led_out_c_g_back
Text GLabel 2950 4850 0    50   Input ~ 0
led_out_d_r_back
Text GLabel 2950 5150 0    50   Input ~ 0
led_out_d_b_back
Text GLabel 2950 5550 0    50   Input ~ 0
button_b_back
Text GLabel 2950 5850 0    50   Input ~ 0
button_d_back
Text GLabel 2950 6400 0    50   Input ~ 0
cv_in_a_back
Text GLabel 4300 3200 2    50   Input ~ 0
dac4_out_a_back
Text GLabel 4300 3500 2    50   Input ~ 0
dac4_out_c_back
Text GLabel 4300 3900 2    50   Input ~ 0
dac8_out_a_back
Text GLabel 4300 4200 2    50   Input ~ 0
dac8_out_c_back
Text GLabel 4300 4500 2    50   Input ~ 0
dac8_out_e_back
Text GLabel 4300 4800 2    50   Input ~ 0
dac8_out_g_back
Text GLabel 4300 5200 2    50   Input ~ 0
gate_out_a_back
Text GLabel 4300 5500 2    50   Input ~ 0
gate_out_c_back
Text GLabel 4300 5900 2    50   Input ~ 0
jack_detect_back
Text GLabel 4300 6300 2    50   Input ~ 0
run_out_back
Text GLabel 4300 6600 2    50   Input ~ 0
var_out_back
Text GLabel 4300 3350 2    50   Input ~ 0
dac4_out_b_back
Text GLabel 4300 3650 2    50   Input ~ 0
dac4_out_d_back
Text GLabel 4300 4050 2    50   Input ~ 0
dac8_out_b_back
Text GLabel 4300 4350 2    50   Input ~ 0
dac8_out_d_back
Text GLabel 4300 4650 2    50   Input ~ 0
dac8_out_f_back
Text GLabel 4300 4950 2    50   Input ~ 0
dac8_out_h_back
Text GLabel 4300 5350 2    50   Input ~ 0
gate_out_b_back
Text GLabel 4300 5650 2    50   Input ~ 0
gate_out_d_back
Text GLabel 4300 6150 2    50   Input ~ 0
clock_out_back
Text GLabel 4300 6450 2    50   Input ~ 0
1_16_out_back
Text GLabel 1950 2500 0    50   Input ~ 0
midi_in-_back
Text GLabel 2950 6250 0    50   Input ~ 0
midi_in-_back
$Comp
L power:GND #PWR05
U 1 1 613C1D3B
P 4150 2250
F 0 "#PWR05" H 4150 2000 50  0001 C CNN
F 1 "GND" H 4155 2077 50  0000 C CNN
F 2 "" H 4150 2250 50  0001 C CNN
F 3 "" H 4150 2250 50  0001 C CNN
	1    4150 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J1
U 1 1 6140B056
P 2150 1450
F 0 "J1" H 2200 1867 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 2200 1776 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x06_P2.54mm_Vertical" H 2150 1450 50  0001 C CNN
F 3 "~" H 2150 1450 50  0001 C CNN
	1    2150 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x06_Odd_Even J2
U 1 1 6140D05F
P 2150 2300
F 0 "J2" H 2200 2717 50  0000 C CNN
F 1 "Conn_02x06_Odd_Even" H 2200 2626 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x06_P2.54mm_Vertical" H 2150 2300 50  0001 C CNN
F 3 "~" H 2150 2300 50  0001 C CNN
	1    2150 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 61581CE3
P 3150 2400
F 0 "#PWR03" H 3150 2150 50  0001 C CNN
F 1 "GND" H 3155 2227 50  0000 C CNN
F 2 "" H 3150 2400 50  0001 C CNN
F 3 "" H 3150 2400 50  0001 C CNN
	1    3150 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2450 2400 3150 2400
$Comp
L Connector_Generic:Conn_01x10 J3
U 1 1 615F1A61
P 4350 1750
F 0 "J3" H 4430 1742 50  0000 L CNN
F 1 "Conn_01x10" H 4430 1651 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x10_P2.54mm_Vertical" H 4350 1750 50  0001 C CNN
F 3 "~" H 4350 1750 50  0001 C CNN
	1    4350 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x12 J4
U 1 1 6160A34B
P 5950 1800
F 0 "J4" H 6030 1792 50  0000 L CNN
F 1 "Conn_01x12" H 6030 1701 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x12_P2.54mm_Vertical" H 5950 1800 50  0001 C CNN
F 3 "~" H 5950 1800 50  0001 C CNN
	1    5950 1800
	1    0    0    -1  
$EndComp
Text GLabel 5750 1800 0    50   Input ~ 0
dac8_out_h_back
Text GLabel 5750 1500 0    50   Input ~ 0
dac8_out_f_back
Text GLabel 5750 1600 0    50   Input ~ 0
dac8_out_d_back
Text GLabel 5750 1700 0    50   Input ~ 0
dac8_out_b_back
Text GLabel 5750 2300 0    50   Input ~ 0
dac4_out_b_back
Text GLabel 5750 1900 0    50   Input ~ 0
dac8_out_g_back
Text GLabel 5750 1400 0    50   Input ~ 0
dac8_out_e_back
Text GLabel 5750 1300 0    50   Input ~ 0
dac8_out_c_back
Text GLabel 5750 2000 0    50   Input ~ 0
dac8_out_a_back
Text GLabel 5750 2200 0    50   Input ~ 0
dac4_out_c_back
Text GLabel 5750 2100 0    50   Input ~ 0
dac4_out_d_back
Text GLabel 5750 2400 0    50   Input ~ 0
dac4_out_a_back
$EndSCHEMATC
