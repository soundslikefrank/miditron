EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
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
S 9100 1400 1250 900 
U 60A48B70
F0 "DAC8564" 50
F1 "dac4.sch" 50
F2 "dac4_din" I L 9100 1650 50 
F3 "dac4_clk" I L 9100 1800 50 
F4 "dac4_cs" I L 9100 1950 50 
F5 "dac4_out_a" O R 10350 1650 50 
F6 "dac4_out_b" O R 10350 1800 50 
F7 "dac4_out_c" O R 10350 1950 50 
F8 "dac4_out_d" O R 10350 2100 50 
F9 "v_ref" O L 9100 2200 50 
$EndSheet
$Sheet
S 9100 2850 1200 1600
U 60A5BF82
F0 "DAC5578" 50
F1 "dac8.sch" 50
F2 "dac8_scl" B L 9100 3150 50 
F3 "dac8_sda" B L 9100 3300 50 
F4 "dac8_out_a" O R 10300 3150 50 
F5 "dac8_out_b" O R 10300 3300 50 
F6 "dac8_out_c" O R 10300 3450 50 
F7 "dac8_out_d" O R 10300 3600 50 
F8 "dac8_out_e" O R 10300 3750 50 
F9 "dac8_out_f" O R 10300 3900 50 
F10 "dac8_out_g" O R 10300 4050 50 
F11 "dac8_out_h" O R 10300 4200 50 
F12 "v_ref" I L 9100 3000 50 
$EndSheet
$Comp
L power:+3.3V #PWR0101
U 1 1 60A5CF6A
P 7250 2100
F 0 "#PWR0101" H 7250 1950 50  0001 C CNN
F 1 "+3.3V" H 7265 2273 50  0000 C CNN
F 2 "" H 7250 2100 50  0001 C CNN
F 3 "" H 7250 2100 50  0001 C CNN
	1    7250 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5800 7150 6000
Wire Wire Line
	7050 5800 7050 6000
Wire Wire Line
	7050 6000 7150 6000
Wire Wire Line
	7250 6000 7250 5800
Connection ~ 7150 6000
Wire Wire Line
	7250 6000 7350 6000
Wire Wire Line
	7350 6000 7350 5800
Connection ~ 7250 6000
$Comp
L power:GND #PWR0102
U 1 1 60A664FC
P 7250 6100
F 0 "#PWR0102" H 7250 5850 50  0001 C CNN
F 1 "GND" H 7255 5927 50  0000 C CNN
F 2 "" H 7250 6100 50  0001 C CNN
F 3 "" H 7250 6100 50  0001 C CNN
	1    7250 6100
	1    0    0    -1  
$EndComp
Text GLabel 7850 3000 2    50   Output ~ 0
spi1_sck
Text GLabel 9100 1800 0    50   Input ~ 0
spi1_sck
Text GLabel 7850 2900 2    50   Output ~ 0
spi1_nss
Text GLabel 9100 1950 0    50   Input ~ 0
spi1_nss
Text GLabel 7850 3200 2    50   Output ~ 0
spi1_mosi
Text GLabel 9100 1650 0    50   Input ~ 0
spi1_mosi
Text GLabel 7850 3300 2    50   Output ~ 0
i2c3_scl
Text GLabel 6550 5000 0    50   BiDi ~ 0
i2c3_sda
Text GLabel 9100 3150 0    50   Input ~ 0
i2c3_scl
Text GLabel 9100 3300 0    50   BiDi ~ 0
i2c3_sda
Wire Wire Line
	7350 6000 7450 6000
Wire Wire Line
	7450 6000 7450 5800
Connection ~ 7350 6000
Wire Wire Line
	7150 6000 7250 6000
Wire Wire Line
	7250 6000 7250 6100
$Comp
L MCU_ST_STM32F4:STM32F401RBTx U3
U 1 1 6100D1FD
P 7250 4000
F 0 "U3" H 7950 5800 50  0000 C CNN
F 1 "STM32F401RBTx" H 7950 5700 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 6650 2300 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00086815.pdf" H 7250 4000 50  0001 C CNN
	1    7250 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2100 7250 2200
Wire Wire Line
	7250 2200 7350 2200
Wire Wire Line
	7350 2200 7350 2300
Connection ~ 7250 2200
Wire Wire Line
	7250 2200 7250 2300
Wire Wire Line
	7350 2200 7450 2200
Wire Wire Line
	7450 2200 7450 2300
Connection ~ 7350 2200
Wire Wire Line
	7250 2200 7150 2200
Wire Wire Line
	7150 2200 7150 2300
Wire Wire Line
	7150 2200 7050 2200
Wire Wire Line
	7050 2200 7050 2300
Connection ~ 7150 2200
Text GLabel 7850 4800 2    50   Output ~ 0
i2c1_scl
Text GLabel 7850 4900 2    50   BiDi ~ 0
i2c1_sda
Text GLabel 2100 1500 0    50   Input ~ 0
i2c2_sda
Text GLabel 7850 4500 2    50   BiDi ~ 0
i2c2_sda
Text GLabel 2100 1700 0    50   Input ~ 0
i2c2_scl
Text GLabel 7850 5200 2    50   Output ~ 0
i2c2_scl
$Comp
L LP5012PWR:LP5012PWR IC?
U 1 1 61050FA5
P 2100 1100
AR Path="/61005BD4/61028BE5/61050FA5" Ref="IC?"  Part="1" 
AR Path="/61005BD4/61050FA5" Ref="IC2"  Part="1" 
F 0 "IC2" H 2700 1365 50  0000 C CNN
F 1 "LP5012PWR" H 2700 1274 50  0000 C CNN
F 2 "LP5012PWR:SOP65P640X120-24N" H 3150 1200 50  0001 L CNN
F 3 "https://www.ti.com/lit/ds/symlink/lp5012.pdf?ts=1615929314042&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F" H 3150 1100 50  0001 L CNN
F 4 "LED Lighting Drivers" H 3150 1000 50  0001 L CNN "Description"
F 5 "1.2" H 3150 900 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 3150 800 50  0001 L CNN "Manufacturer_Name"
F 7 "LP5012PWR" H 3150 700 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-LP5012PWR" H 3150 600 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/LP5012PWR?qs=T94vaHKWudSL6jLwBy12Hg%3D%3D" H 3150 500 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 3150 400 50  0001 L CNN "Arrow Part Number"
F 11 "" H 3150 300 50  0001 L CNN "Arrow Price/Stock"
	1    2100 1100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR070
U 1 1 61050FAB
P 1000 1000
AR Path="/61005BD4/61050FAB" Ref="#PWR070"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FAB" Ref="#PWR?"  Part="1" 
F 0 "#PWR070" H 1000 850 50  0001 C CNN
F 1 "+3.3V" H 1015 1173 50  0000 C CNN
F 2 "" H 1000 1000 50  0001 C CNN
F 3 "" H 1000 1000 50  0001 C CNN
	1    1000 1000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR071
U 1 1 61050FB1
P 1000 1300
AR Path="/61005BD4/61050FB1" Ref="#PWR071"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FB1" Ref="#PWR?"  Part="1" 
F 0 "#PWR071" H 1000 1050 50  0001 C CNN
F 1 "GND" H 1005 1127 50  0000 C CNN
F 2 "" H 1000 1300 50  0001 C CNN
F 3 "" H 1000 1300 50  0001 C CNN
	1    1000 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 61050FB7
P 1000 1150
AR Path="/61005BD4/61050FB7" Ref="C2"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FB7" Ref="C?"  Part="1" 
F 0 "C2" H 1115 1196 50  0000 L CNN
F 1 "100n" H 1115 1105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1038 1000 50  0001 C CNN
F 3 "~" H 1000 1150 50  0001 C CNN
	1    1000 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR080
U 1 1 61050FBD
P 1800 1200
AR Path="/61005BD4/61050FBD" Ref="#PWR080"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FBD" Ref="#PWR?"  Part="1" 
F 0 "#PWR080" H 1800 950 50  0001 C CNN
F 1 "GND" H 1805 1027 50  0000 C CNN
F 2 "" H 1800 1200 50  0001 C CNN
F 3 "" H 1800 1200 50  0001 C CNN
	1    1800 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	1800 1200 1800 1100
Wire Wire Line
	1800 1100 2100 1100
Wire Wire Line
	1800 1200 2100 1200
Connection ~ 1800 1200
Wire Wire Line
	1800 1200 1800 1300
Wire Wire Line
	1800 1300 2100 1300
$Comp
L power:+3.3V #PWR078
U 1 1 61050FC9
P 1650 1400
AR Path="/61005BD4/61050FC9" Ref="#PWR078"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FC9" Ref="#PWR?"  Part="1" 
F 0 "#PWR078" H 1650 1250 50  0001 C CNN
F 1 "+3.3V" H 1665 1573 50  0000 C CNN
F 2 "" H 1650 1400 50  0001 C CNN
F 3 "" H 1650 1400 50  0001 C CNN
	1    1650 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 1400 2100 1400
$Comp
L power:GND #PWR079
U 1 1 61050FD1
P 1750 1600
AR Path="/61005BD4/61050FD1" Ref="#PWR079"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FD1" Ref="#PWR?"  Part="1" 
F 0 "#PWR079" H 1750 1350 50  0001 C CNN
F 1 "GND" H 1755 1427 50  0000 C CNN
F 2 "" H 1750 1600 50  0001 C CNN
F 3 "" H 1750 1600 50  0001 C CNN
	1    1750 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 1600 2100 1600
$Comp
L power:+3.3V #PWR074
U 1 1 61050FD9
P 1100 1800
AR Path="/61005BD4/61050FD9" Ref="#PWR074"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FD9" Ref="#PWR?"  Part="1" 
F 0 "#PWR074" H 1100 1650 50  0001 C CNN
F 1 "+3.3V" H 1115 1973 50  0000 C CNN
F 2 "" H 1100 1800 50  0001 C CNN
F 3 "" H 1100 1800 50  0001 C CNN
	1    1100 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 61050FDF
P 1400 1800
AR Path="/61005BD4/61028BE5/61050FDF" Ref="R?"  Part="1" 
AR Path="/61005BD4/61050FDF" Ref="R4"  Part="1" 
F 0 "R4" V 1607 1800 50  0000 C CNN
F 1 "10k" V 1516 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1330 1800 50  0001 C CNN
F 3 "~" H 1400 1800 50  0001 C CNN
	1    1400 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 1800 2100 1800
Wire Wire Line
	1100 1800 1250 1800
$Comp
L Device:R R?
U 1 1 61050FE7
P 750 2350
AR Path="/61005BD4/61028BE5/61050FE7" Ref="R?"  Part="1" 
AR Path="/61005BD4/61050FE7" Ref="R3"  Part="1" 
F 0 "R3" H 680 2304 50  0000 R CNN
F 1 "27k" H 680 2395 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" V 680 2350 50  0001 C CNN
F 3 "~" H 750 2350 50  0001 C CNN
	1    750  2350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR067
U 1 1 61050FED
P 750 2500
AR Path="/61005BD4/61050FED" Ref="#PWR067"  Part="1" 
AR Path="/61005BD4/61028BE5/61050FED" Ref="#PWR?"  Part="1" 
F 0 "#PWR067" H 750 2250 50  0001 C CNN
F 1 "GND" H 755 2327 50  0000 C CNN
F 2 "" H 750 2500 50  0001 C CNN
F 3 "" H 750 2500 50  0001 C CNN
	1    750  2500
	1    0    0    -1  
$EndComp
Text Notes 1000 2450 0    50   ~ 0
Current-limiting resistor. Adjust to LEDs
$Comp
L Device:C C?
U 1 1 61050FF4
P 1400 2200
AR Path="/61005BD4/61028BE5/61050FF4" Ref="C?"  Part="1" 
AR Path="/61005BD4/61050FF4" Ref="C4"  Part="1" 
F 0 "C4" V 1148 2200 50  0000 C CNN
F 1 "1u" V 1239 2200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1438 2050 50  0001 C CNN
F 3 "~" H 1400 2200 50  0001 C CNN
	1    1400 2200
	0    1    1    0   
$EndComp
Text HLabel 2100 2200 0    50   Output ~ 0
led_out_a_r
Text HLabel 3300 1100 2    50   Output ~ 0
led_out_d_b
Text HLabel 3300 1200 2    50   Output ~ 0
led_out_d_g
Text HLabel 3300 1300 2    50   Output ~ 0
led_out_d_r
Text HLabel 3300 1400 2    50   Output ~ 0
led_out_c_b
Text HLabel 3300 1500 2    50   Output ~ 0
led_out_c_g
Text HLabel 3300 1600 2    50   Output ~ 0
led_out_c_r
Text HLabel 3300 1800 2    50   Output ~ 0
led_out_b_b
Text HLabel 3300 1900 2    50   Output ~ 0
led_out_b_g
Text HLabel 3300 2000 2    50   Output ~ 0
led_out_b_r
Text HLabel 3300 2100 2    50   Output ~ 0
led_out_a_b
Text HLabel 3300 2200 2    50   Output ~ 0
led_out_a_g
$Comp
L power:GND #PWR089
U 1 1 6105100B
P 3900 1700
AR Path="/61005BD4/6105100B" Ref="#PWR089"  Part="1" 
AR Path="/61005BD4/61028BE5/6105100B" Ref="#PWR?"  Part="1" 
F 0 "#PWR089" H 3900 1450 50  0001 C CNN
F 1 "GND" H 3905 1527 50  0000 C CNN
F 2 "" H 3900 1700 50  0001 C CNN
F 3 "" H 3900 1700 50  0001 C CNN
	1    3900 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 1700 3900 1700
Wire Wire Line
	2100 2000 1550 2000
Wire Wire Line
	1550 2000 1550 2200
$Comp
L power:GND #PWR077
U 1 1 610735CB
P 1250 2200
AR Path="/61005BD4/610735CB" Ref="#PWR077"  Part="1" 
AR Path="/61005BD4/61028BE5/610735CB" Ref="#PWR?"  Part="1" 
F 0 "#PWR077" H 1250 1950 50  0001 C CNN
F 1 "GND" H 1255 2027 50  0000 C CNN
F 2 "" H 1250 2200 50  0001 C CNN
F 3 "" H 1250 2200 50  0001 C CNN
	1    1250 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	2100 1900 1100 1900
Wire Wire Line
	1100 1900 1100 2050
Wire Wire Line
	1100 2050 750  2050
Wire Wire Line
	750  2050 750  2200
$Comp
L power:+3.3V #PWR099
U 1 1 610771A7
P 6850 950
AR Path="/61005BD4/610771A7" Ref="#PWR099"  Part="1" 
AR Path="/61005BD4/61028BE5/610771A7" Ref="#PWR?"  Part="1" 
F 0 "#PWR099" H 6850 800 50  0001 C CNN
F 1 "+3.3V" H 6865 1123 50  0000 C CNN
F 2 "" H 6850 950 50  0001 C CNN
F 3 "" H 6850 950 50  0001 C CNN
	1    6850 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0100
U 1 1 610771AD
P 6850 1550
AR Path="/61005BD4/610771AD" Ref="#PWR0100"  Part="1" 
AR Path="/61005BD4/61028BE5/610771AD" Ref="#PWR?"  Part="1" 
F 0 "#PWR0100" H 6850 1300 50  0001 C CNN
F 1 "GND" H 6855 1377 50  0000 C CNN
F 2 "" H 6850 1550 50  0001 C CNN
F 3 "" H 6850 1550 50  0001 C CNN
	1    6850 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 610771B3
P 6000 1250
AR Path="/61005BD4/610771B3" Ref="C10"  Part="1" 
AR Path="/61005BD4/61028BE5/610771B3" Ref="C?"  Part="1" 
F 0 "C10" H 6115 1296 50  0000 L CNN
F 1 "100n" H 6115 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6038 1100 50  0001 C CNN
F 3 "~" H 6000 1250 50  0001 C CNN
	1    6000 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 61078F3B
P 6450 1250
AR Path="/61005BD4/61078F3B" Ref="C13"  Part="1" 
AR Path="/61005BD4/61028BE5/61078F3B" Ref="C?"  Part="1" 
F 0 "C13" H 6565 1296 50  0000 L CNN
F 1 "100n" H 6565 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6488 1100 50  0001 C CNN
F 3 "~" H 6450 1250 50  0001 C CNN
	1    6450 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 610791EB
P 6850 1250
AR Path="/61005BD4/610791EB" Ref="C14"  Part="1" 
AR Path="/61005BD4/61028BE5/610791EB" Ref="C?"  Part="1" 
F 0 "C14" H 6965 1296 50  0000 L CNN
F 1 "100n" H 6965 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6888 1100 50  0001 C CNN
F 3 "~" H 6850 1250 50  0001 C CNN
	1    6850 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 610796F3
P 7250 1250
AR Path="/61005BD4/610796F3" Ref="C15"  Part="1" 
AR Path="/61005BD4/61028BE5/610796F3" Ref="C?"  Part="1" 
F 0 "C15" H 7365 1296 50  0000 L CNN
F 1 "100n" H 7365 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7288 1100 50  0001 C CNN
F 3 "~" H 7250 1250 50  0001 C CNN
	1    7250 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C16
U 1 1 61079ACB
P 7650 1250
AR Path="/61005BD4/61079ACB" Ref="C16"  Part="1" 
AR Path="/61005BD4/61028BE5/61079ACB" Ref="C?"  Part="1" 
F 0 "C16" H 7765 1296 50  0000 L CNN
F 1 "100n" H 7765 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7688 1100 50  0001 C CNN
F 3 "~" H 7650 1250 50  0001 C CNN
	1    7650 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 950  6850 1100
Wire Wire Line
	6000 1100 6450 1100
Connection ~ 6450 1100
Wire Wire Line
	6450 1100 6850 1100
Connection ~ 6850 1100
Wire Wire Line
	6850 1100 7250 1100
Connection ~ 7250 1100
Wire Wire Line
	7250 1100 7650 1100
Wire Wire Line
	6000 1400 6450 1400
Connection ~ 6450 1400
Wire Wire Line
	6450 1400 6850 1400
Connection ~ 6850 1400
Wire Wire Line
	6850 1400 7250 1400
Connection ~ 7250 1400
Wire Wire Line
	7250 1400 7650 1400
Wire Wire Line
	6850 1400 6850 1550
Text HLabel 10350 1650 2    50   Output ~ 0
dac4_out_a
Text HLabel 10350 1800 2    50   Output ~ 0
dac4_out_b
Text HLabel 10350 1950 2    50   Output ~ 0
dac4_out_c
Text HLabel 10350 2100 2    50   Output ~ 0
dac4_out_d
Text HLabel 10300 3150 2    50   Output ~ 0
dac8_out_a
Text HLabel 10300 3300 2    50   Output ~ 0
dac8_out_b
Text HLabel 10300 3450 2    50   Output ~ 0
dac8_out_c
Text HLabel 10300 3600 2    50   Output ~ 0
dac8_out_d
Text HLabel 10300 3750 2    50   Output ~ 0
dac8_out_e
Text HLabel 10300 3900 2    50   Output ~ 0
dac8_out_f
Text HLabel 10300 4050 2    50   Output ~ 0
dac8_out_g
Text HLabel 10300 4200 2    50   Output ~ 0
dac8_out_h
Text HLabel 6550 4100 0    50   Input ~ 0
button_a
Text HLabel 6550 4200 0    50   Input ~ 0
button_b
Text HLabel 6550 4300 0    50   Input ~ 0
button_c
Text HLabel 6550 4400 0    50   Input ~ 0
button_d
Text HLabel 9100 4950 0    50   Input ~ 0
cv_jack_a
Text GLabel 6550 4500 0    50   Output ~ 0
clock_out_l
Text GLabel 6550 4600 0    50   Output ~ 0
run_out_l
Text GLabel 7850 4200 2    50   Output ~ 0
1_16_out_l
Text GLabel 7850 5300 2    50   Output ~ 0
gate_out_a_l
Text GLabel 7850 5400 2    50   Output ~ 0
gate_out_b_l
Text GLabel 7850 5500 2    50   Output ~ 0
gate_out_c_l
Text GLabel 7850 5600 2    50   Output ~ 0
gate_out_d_l
Text GLabel 7850 4300 2    50   Output ~ 0
var_out_l
Text HLabel 9100 5100 0    50   Input ~ 0
cv_jack_b
Text HLabel 7850 2700 2    50   Output ~ 0
jack_detect
$Comp
L power:+3.3VA #PWR093
U 1 1 610301ED
P 5100 950
F 0 "#PWR093" H 5100 800 50  0001 C CNN
F 1 "+3.3VA" H 5115 1123 50  0000 C CNN
F 2 "" H 5100 950 50  0001 C CNN
F 3 "" H 5100 950 50  0001 C CNN
	1    5100 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1400 5100 1550
Wire Wire Line
	5100 1400 5500 1400
Connection ~ 5100 1400
Wire Wire Line
	5100 1100 5500 1100
Connection ~ 5100 1100
Wire Wire Line
	5100 950  5100 1100
$Comp
L Device:C C9
U 1 1 6102DFD0
P 5500 1250
AR Path="/61005BD4/6102DFD0" Ref="C9"  Part="1" 
AR Path="/61005BD4/61028BE5/6102DFD0" Ref="C?"  Part="1" 
F 0 "C9" H 5615 1296 50  0000 L CNN
F 1 "100n" H 5615 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5538 1100 50  0001 C CNN
F 3 "~" H 5500 1250 50  0001 C CNN
	1    5500 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 6102DFCA
P 5100 1250
AR Path="/61005BD4/6102DFCA" Ref="C7"  Part="1" 
AR Path="/61005BD4/61028BE5/6102DFCA" Ref="C?"  Part="1" 
F 0 "C7" H 5215 1296 50  0000 L CNN
F 1 "1u" H 5215 1205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5138 1100 50  0001 C CNN
F 3 "~" H 5100 1250 50  0001 C CNN
	1    5100 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR094
U 1 1 6102DFB8
P 5100 1550
AR Path="/61005BD4/6102DFB8" Ref="#PWR094"  Part="1" 
AR Path="/61005BD4/61028BE5/6102DFB8" Ref="#PWR?"  Part="1" 
F 0 "#PWR094" H 5100 1300 50  0001 C CNN
F 1 "GND" H 5105 1377 50  0000 C CNN
F 2 "" H 5100 1550 50  0001 C CNN
F 3 "" H 5100 1550 50  0001 C CNN
	1    5100 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR098
U 1 1 61038F17
P 6550 3000
F 0 "#PWR098" H 6550 2850 50  0001 C CNN
F 1 "+3.3VA" V 6565 3127 50  0000 L CNN
F 2 "" H 6550 3000 50  0001 C CNN
F 3 "" H 6550 3000 50  0001 C CNN
	1    6550 3000
	0    -1   -1   0   
$EndComp
Text Notes 5500 3300 0    50   ~ 0
LowESR < 1Ω Ceramic
$Comp
L Device:C C11
U 1 1 61044803
P 6000 2900
AR Path="/61005BD4/61044803" Ref="C11"  Part="1" 
AR Path="/61005BD4/61028BE5/61044803" Ref="C?"  Part="1" 
F 0 "C11" H 6115 2946 50  0000 L CNN
F 1 "4.7u" H 6115 2855 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6038 2750 50  0001 C CNN
F 3 "~" H 6000 2900 50  0001 C CNN
	1    6000 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 2900 6150 2900
$Comp
L power:GND #PWR096
U 1 1 61046470
P 5850 2900
AR Path="/61005BD4/61046470" Ref="#PWR096"  Part="1" 
AR Path="/61005BD4/61028BE5/61046470" Ref="#PWR?"  Part="1" 
F 0 "#PWR096" H 5850 2650 50  0001 C CNN
F 1 "GND" H 5855 2727 50  0000 C CNN
F 2 "" H 5850 2900 50  0001 C CNN
F 3 "" H 5850 2900 50  0001 C CNN
	1    5850 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 61048342
P 6000 2700
AR Path="/61005BD4/61028BE5/61048342" Ref="R?"  Part="1" 
AR Path="/61005BD4/61048342" Ref="R8"  Part="1" 
F 0 "R8" V 6207 2700 50  0000 C CNN
F 1 "10k" V 6116 2700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5930 2700 50  0001 C CNN
F 3 "~" H 6000 2700 50  0001 C CNN
	1    6000 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 2700 6550 2700
Text GLabel 5900 2350 0    50   Input ~ 0
jtag_reset
$Comp
L Device:C C12
U 1 1 6104CE00
P 6300 2350
AR Path="/61005BD4/6104CE00" Ref="C12"  Part="1" 
AR Path="/61005BD4/61028BE5/6104CE00" Ref="C?"  Part="1" 
F 0 "C12" H 6415 2396 50  0000 L CNN
F 1 "100n" H 6415 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6338 2200 50  0001 C CNN
F 3 "~" H 6300 2350 50  0001 C CNN
	1    6300 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR097
U 1 1 6104DB09
P 6300 2200
AR Path="/61005BD4/6104DB09" Ref="#PWR097"  Part="1" 
AR Path="/61005BD4/61028BE5/6104DB09" Ref="#PWR?"  Part="1" 
F 0 "#PWR097" H 6300 1950 50  0001 C CNN
F 1 "GND" H 6305 2027 50  0000 C CNN
F 2 "" H 6300 2200 50  0001 C CNN
F 3 "" H 6300 2200 50  0001 C CNN
	1    6300 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 2500 6550 2500
Wire Wire Line
	6300 2500 6150 2500
Wire Wire Line
	6150 2500 6150 2350
Wire Wire Line
	6150 2350 5900 2350
Connection ~ 6300 2500
$Comp
L power:GND #PWR095
U 1 1 61059893
P 5850 2700
AR Path="/61005BD4/61059893" Ref="#PWR095"  Part="1" 
AR Path="/61005BD4/61028BE5/61059893" Ref="#PWR?"  Part="1" 
F 0 "#PWR095" H 5850 2450 50  0001 C CNN
F 1 "GND" H 5855 2527 50  0000 C CNN
F 2 "" H 5850 2700 50  0001 C CNN
F 3 "" H 5850 2700 50  0001 C CNN
	1    5850 2700
	0    1    1    0   
$EndComp
Text GLabel 6550 3600 0    50   Input ~ 0
hse_in
Text GLabel 6550 3700 0    50   Output ~ 0
hse_out
NoConn ~ 6550 3900
$Comp
L power:GND #PWR082
U 1 1 60A4D09B
P 1850 7400
F 0 "#PWR082" H 1850 7150 50  0001 C CNN
F 1 "GND" H 1855 7227 50  0000 C CNN
F 2 "" H 1850 7400 50  0001 C CNN
F 3 "" H 1850 7400 50  0001 C CNN
	1    1850 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 6750 1450 6850
Wire Wire Line
	1450 7250 1850 7250
Wire Wire Line
	1850 7250 1850 7150
Connection ~ 1450 6850
Wire Wire Line
	1450 6850 1450 6950
Connection ~ 1450 6950
Wire Wire Line
	1450 6950 1450 7250
Wire Wire Line
	1850 7250 1850 7400
Connection ~ 1850 7250
Wire Wire Line
	1850 7250 2250 7250
Wire Wire Line
	2250 7250 2250 6950
$Comp
L power:+3.3V #PWR081
U 1 1 60A52E41
P 1850 6550
F 0 "#PWR081" H 1850 6400 50  0001 C CNN
F 1 "+3.3V" H 1865 6723 50  0000 C CNN
F 2 "" H 1850 6550 50  0001 C CNN
F 3 "" H 1850 6550 50  0001 C CNN
	1    1850 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR068
U 1 1 60A58EE0
P 950 6600
F 0 "#PWR068" H 950 6450 50  0001 C CNN
F 1 "+3.3V" H 965 6773 50  0000 C CNN
F 2 "" H 950 6600 50  0001 C CNN
F 3 "" H 950 6600 50  0001 C CNN
	1    950  6600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR069
U 1 1 60A592F0
P 950 6900
F 0 "#PWR069" H 950 6650 50  0001 C CNN
F 1 "GND" H 955 6727 50  0000 C CNN
F 2 "" H 950 6900 50  0001 C CNN
F 3 "" H 950 6900 50  0001 C CNN
	1    950  6900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 60A598C4
P 950 6750
F 0 "C1" H 1065 6796 50  0000 L CNN
F 1 "100n" H 1065 6705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 988 6600 50  0001 C CNN
F 3 "~" H 950 6750 50  0001 C CNN
	1    950  6750
	1    0    0    -1  
$EndComp
$Comp
L Memory_EEPROM:CAT24C256 U1
U 1 1 60A44E16
P 1850 6850
F 0 "U1" H 1450 7250 50  0000 C CNN
F 1 "AT24C256C" H 1450 7150 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 1850 6850 50  0001 C CNN
F 3 "https://www.onsemi.cn/PowerSolutions/document/CAT24C256-D.PDF" H 1850 6850 50  0001 C CNN
	1    1850 6850
	1    0    0    -1  
$EndComp
Text GLabel 2250 6850 2    50   Input ~ 0
i2c1_scl
Text GLabel 2250 6750 2    50   BiDi ~ 0
i2c1_sda
$Comp
L SN74AHCT244PW:SN74AHCT244PW IC1
U 1 1 610D29D0
P 1200 3500
F 0 "IC1" H 1750 3765 50  0000 C CNN
F 1 "SN74AHCT244PW" H 1750 3674 50  0000 C CNN
F 2 "SN74AHCT244PW:SOP65P640X120-20N" H 2150 3600 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/SN74AHCT244" H 2150 3500 50  0001 L CNN
F 4 "Texas Instruments SN74AHCT244PW Octal Buffer & Line Driver, 3-State, 5V, 20-Pin TSSOP" H 2150 3400 50  0001 L CNN "Description"
F 5 "1.2" H 2150 3300 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 2150 3200 50  0001 L CNN "Manufacturer_Name"
F 7 "SN74AHCT244PW" H 2150 3100 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-SN74AHCT244PW" H 2150 3000 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/SN74AHCT244PW?qs=zhgwDAIOVxtc1r1arA7EAg%3D%3D" H 2150 2900 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 2150 2800 50  0001 L CNN "Arrow Part Number"
F 11 "" H 2150 2700 50  0001 L CNN "Arrow Price/Stock"
	1    1200 3500
	1    0    0    -1  
$EndComp
Text HLabel 2300 3700 2    50   Output ~ 0
gate_out_a
Text HLabel 1200 4300 0    50   Output ~ 0
clock_out
Text HLabel 1200 4100 0    50   Output ~ 0
run_out
Text HLabel 1200 3900 0    50   Output ~ 0
1_16_out
Text HLabel 2300 3900 2    50   Output ~ 0
gate_out_b
Text HLabel 2300 4100 2    50   Output ~ 0
gate_out_c
Text HLabel 2300 4300 2    50   Output ~ 0
gate_out_d
$Comp
L power:GND #PWR072
U 1 1 610D7678
P 1050 3400
AR Path="/61005BD4/610D7678" Ref="#PWR072"  Part="1" 
AR Path="/61005BD4/61028BE5/610D7678" Ref="#PWR?"  Part="1" 
F 0 "#PWR072" H 1050 3150 50  0001 C CNN
F 1 "GND" H 1055 3227 50  0000 C CNN
F 2 "" H 1050 3400 50  0001 C CNN
F 3 "" H 1050 3400 50  0001 C CNN
	1    1050 3400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR083
U 1 1 610D7D28
P 2300 3600
AR Path="/61005BD4/610D7D28" Ref="#PWR083"  Part="1" 
AR Path="/61005BD4/61028BE5/610D7D28" Ref="#PWR?"  Part="1" 
F 0 "#PWR083" H 2300 3350 50  0001 C CNN
F 1 "GND" H 2305 3427 50  0000 C CNN
F 2 "" H 2300 3600 50  0001 C CNN
F 3 "" H 2300 3600 50  0001 C CNN
	1    2300 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR073
U 1 1 610D8919
P 1050 4550
AR Path="/61005BD4/610D8919" Ref="#PWR073"  Part="1" 
AR Path="/61005BD4/61028BE5/610D8919" Ref="#PWR?"  Part="1" 
F 0 "#PWR073" H 1050 4300 50  0001 C CNN
F 1 "GND" H 1055 4377 50  0000 C CNN
F 2 "" H 1050 4550 50  0001 C CNN
F 3 "" H 1050 4550 50  0001 C CNN
	1    1050 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 3500 2500 3500
Wire Wire Line
	2500 3500 2500 3400
$Comp
L power:+5V #PWR084
U 1 1 610DCEDF
P 2500 3400
F 0 "#PWR084" H 2500 3250 50  0001 C CNN
F 1 "+5V" H 2515 3573 50  0000 C CNN
F 2 "" H 2500 3400 50  0001 C CNN
F 3 "" H 2500 3400 50  0001 C CNN
	1    2500 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR086
U 1 1 610E91A5
P 3050 4100
AR Path="/61005BD4/610E91A5" Ref="#PWR086"  Part="1" 
AR Path="/61005BD4/61028BE5/610E91A5" Ref="#PWR?"  Part="1" 
F 0 "#PWR086" H 3050 3850 50  0001 C CNN
F 1 "GND" H 3055 3927 50  0000 C CNN
F 2 "" H 3050 4100 50  0001 C CNN
F 3 "" H 3050 4100 50  0001 C CNN
	1    3050 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 610E91AB
P 3050 3950
AR Path="/61005BD4/610E91AB" Ref="C5"  Part="1" 
AR Path="/61005BD4/61028BE5/610E91AB" Ref="C?"  Part="1" 
F 0 "C5" H 3165 3996 50  0000 L CNN
F 1 "100n" H 3165 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3088 3800 50  0001 C CNN
F 3 "~" H 3050 3950 50  0001 C CNN
	1    3050 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR085
U 1 1 610EA000
P 3050 3800
F 0 "#PWR085" H 3050 3650 50  0001 C CNN
F 1 "+5V" H 3065 3973 50  0000 C CNN
F 2 "" H 3050 3800 50  0001 C CNN
F 3 "" H 3050 3800 50  0001 C CNN
	1    3050 3800
	1    0    0    -1  
$EndComp
Text GLabel 2300 4400 2    50   Input ~ 0
clock_out_l
Text GLabel 2300 4200 2    50   Input ~ 0
run_out_l
Text GLabel 2300 4000 2    50   Input ~ 0
1_16_out_l
Text GLabel 1200 3600 0    50   Input ~ 0
gate_out_a_l
Wire Wire Line
	1050 3400 1050 3500
Wire Wire Line
	1050 3500 1200 3500
Wire Wire Line
	1200 4400 1050 4400
Wire Wire Line
	1050 4400 1050 4550
Text GLabel 1200 3800 0    50   Input ~ 0
gate_out_b_l
Text GLabel 1200 4000 0    50   Input ~ 0
gate_out_c_l
Text GLabel 1200 4200 0    50   Input ~ 0
gate_out_d_l
Text GLabel 2300 3800 2    50   Input ~ 0
var_out_l
Text HLabel 1200 3700 0    50   Output ~ 0
var_out
$Comp
L Device:Crystal Y1
U 1 1 6107B19E
P 4550 3850
F 0 "Y1" H 4550 4118 50  0000 C CNN
F 1 "X50328MSB2GI" H 4550 4027 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_5032-2Pin_5.0x3.2mm" H 4550 3850 50  0001 C CNN
F 3 "https://lcsc.com/product-detail/Crystals_Yangxing-Tech-X50328MSB2GI_C115962.html~" H 4550 3850 50  0001 C CNN
	1    4550 3850
	1    0    0    -1  
$EndComp
Text Notes 4100 3450 0    50   ~ 0
8MHz\n20pF load capacitance
$Comp
L Device:C C6
U 1 1 61085EEA
P 4000 3600
AR Path="/61005BD4/61085EEA" Ref="C6"  Part="1" 
AR Path="/61005BD4/61028BE5/61085EEA" Ref="C?"  Part="1" 
F 0 "C6" H 4115 3646 50  0000 L CNN
F 1 "27p" H 4115 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4038 3450 50  0001 C CNN
F 3 "~" H 4000 3600 50  0001 C CNN
	1    4000 3600
	-1   0    0    1   
$EndComp
$Comp
L Device:C C8
U 1 1 61086B48
P 5100 3600
AR Path="/61005BD4/61086B48" Ref="C8"  Part="1" 
AR Path="/61005BD4/61028BE5/61086B48" Ref="C?"  Part="1" 
F 0 "C8" H 5215 3646 50  0000 L CNN
F 1 "27p" H 5215 3555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5138 3450 50  0001 C CNN
F 3 "~" H 5100 3600 50  0001 C CNN
	1    5100 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4700 3850 5100 3850
Wire Wire Line
	5100 3850 5100 3750
Wire Wire Line
	4000 3750 4000 3850
Wire Wire Line
	4000 3850 4400 3850
$Comp
L power:GND #PWR092
U 1 1 6108B3D1
P 4550 3100
AR Path="/61005BD4/6108B3D1" Ref="#PWR092"  Part="1" 
AR Path="/61005BD4/61028BE5/6108B3D1" Ref="#PWR?"  Part="1" 
F 0 "#PWR092" H 4550 2850 50  0001 C CNN
F 1 "GND" H 4555 2927 50  0000 C CNN
F 2 "" H 4550 3100 50  0001 C CNN
F 3 "" H 4550 3100 50  0001 C CNN
	1    4550 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 3450 4000 3100
Wire Wire Line
	4000 3100 4550 3100
Wire Wire Line
	4550 3100 5100 3100
Wire Wire Line
	5100 3100 5100 3450
Connection ~ 4550 3100
Text GLabel 5100 4450 3    50   Input ~ 0
hse_out
$Comp
L Device:R R?
U 1 1 6108FAF6
P 5100 4150
AR Path="/61005BD4/61028BE5/6108FAF6" Ref="R?"  Part="1" 
AR Path="/61005BD4/6108FAF6" Ref="R7"  Part="1" 
F 0 "R7" V 5307 4150 50  0000 C CNN
F 1 "680R" V 5216 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5030 4150 50  0001 C CNN
F 3 "~" H 5100 4150 50  0001 C CNN
	1    5100 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3850 5100 4000
Connection ~ 5100 3850
Wire Wire Line
	5100 4300 5100 4450
Text GLabel 4000 4450 3    50   Output ~ 0
hse_in
Wire Wire Line
	4000 4450 4000 3850
Connection ~ 4000 3850
Text GLabel 7850 3800 2    50   Input ~ 0
jtag_swdio
Text GLabel 7850 3900 2    50   Input ~ 0
jtag_swclk
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 610DA179
P 3900 6950
AR Path="/61005BD4/610D605D/610DA179" Ref="J?"  Part="1" 
AR Path="/61005BD4/610DA179" Ref="J32"  Part="1" 
F 0 "J32" H 3950 7367 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 3950 7276 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical" H 3900 6950 50  0001 C CNN
F 3 "~" H 3900 6950 50  0001 C CNN
	1    3900 6950
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 610DA184
P 3700 6750
AR Path="/5FDE753F/610DA184" Ref="#PWR?"  Part="1" 
AR Path="/610DA184" Ref="#PWR?"  Part="1" 
AR Path="/5FEE41D4/610DA184" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/610D605D/610DA184" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/610DA184" Ref="#PWR088"  Part="1" 
F 0 "#PWR088" H 3700 6600 50  0001 C CNN
F 1 "+3V3" V 3715 6878 50  0000 L CNN
F 2 "" H 3700 6750 50  0001 C CNN
F 3 "" H 3700 6750 50  0001 C CNN
	1    3700 6750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 610DA18A
P 3550 7150
AR Path="/610DA18A" Ref="#PWR?"  Part="1" 
AR Path="/5FEE41D4/610DA18A" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/610D605D/610DA18A" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/610DA18A" Ref="#PWR087"  Part="1" 
F 0 "#PWR087" H 3550 6900 50  0001 C CNN
F 1 "GND" H 3555 6977 50  0000 C CNN
F 2 "" H 3550 7150 50  0001 C CNN
F 3 "" H 3550 7150 50  0001 C CNN
	1    3550 7150
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 7150 3600 7150
Wire Wire Line
	3700 6950 3600 6950
Wire Wire Line
	3600 6950 3600 7150
Connection ~ 3600 7150
Wire Wire Line
	3600 7150 3550 7150
NoConn ~ 3700 7050
Wire Wire Line
	3600 6950 3600 6850
Wire Wire Line
	3600 6850 3700 6850
Connection ~ 3600 6950
Text GLabel 4200 6750 2    50   Output ~ 0
jtag_swdio
Text GLabel 4200 6850 2    50   Output ~ 0
jtag_swclk
NoConn ~ 4200 6950
NoConn ~ 4200 7050
Text GLabel 4200 7150 2    50   Output ~ 0
jtag_reset
$Sheet
S 9100 5750 1200 600 
U 6102A76E
F0 "Power & Ref" 50
F1 "power_ref.sch" 50
$EndSheet
NoConn ~ 7850 2800
NoConn ~ 7850 3100
NoConn ~ 7850 3400
NoConn ~ 7850 3600
NoConn ~ 7850 3700
NoConn ~ 7850 4000
NoConn ~ 6550 5300
NoConn ~ 6550 5400
NoConn ~ 7850 4400
NoConn ~ 7850 4600
NoConn ~ 7850 4700
NoConn ~ 7850 5000
NoConn ~ 7850 5100
NoConn ~ 6550 5500
NoConn ~ 6550 5600
NoConn ~ 6550 4900
NoConn ~ 6550 4800
NoConn ~ 6550 4700
NoConn ~ 6550 5200
NoConn ~ 6550 5100
Wire Wire Line
	9100 2200 8950 2200
Wire Wire Line
	8950 2200 8950 3000
Wire Wire Line
	8950 3000 9100 3000
$Sheet
S 9100 4800 1200 600 
U 612EE3A1
F0 "CV Input" 50
F1 "cv_input.sch" 50
F2 "cv_in_a" O R 10300 4950 50 
F3 "cv_in_b" O R 10300 5100 50 
F4 "cv_jack_a" I L 9100 4950 50 
F5 "cv_jack_b" I L 9100 5100 50 
$EndSheet
Text GLabel 7850 2500 2    50   Input ~ 0
cv_in_a
Text GLabel 7850 2600 2    50   Input ~ 0
cv_in_b
Text GLabel 10300 4950 2    50   Input ~ 0
cv_in_a
Text GLabel 10300 5100 2    50   Input ~ 0
cv_in_b
$Comp
L Isolator:6N137 U?
U 1 1 61476840
P 3850 5550
AR Path="/60A7E42A/61476840" Ref="U?"  Part="1" 
AR Path="/60A44BB1/61476840" Ref="U?"  Part="1" 
AR Path="/61476840" Ref="U?"  Part="1" 
AR Path="/61006ED6/61476840" Ref="U?"  Part="1" 
AR Path="/61005BD4/61476840" Ref="U2"  Part="1" 
F 0 "U2" H 3850 6017 50  0000 C CNN
F 1 "6N137" H 3850 5926 50  0000 C CNN
F 2 "Package_DIP:SMDIP-8_W9.53mm" H 3850 5050 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-0940EN" H 3000 6100 50  0001 C CNN
	1    3850 5550
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148 D?
U 1 1 61476857
P 2900 5700
AR Path="/61006ED6/61476857" Ref="D?"  Part="1" 
AR Path="/61005BD4/61476857" Ref="D2"  Part="1" 
F 0 "D2" V 2854 5780 50  0000 L CNN
F 1 "1N4148" V 2945 5780 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-123" H 2900 5525 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 2900 5700 50  0001 C CNN
	1    2900 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 6147685D
P 2600 5550
AR Path="/61006ED6/6147685D" Ref="R?"  Part="1" 
AR Path="/61005BD4/6147685D" Ref="R5"  Part="1" 
F 0 "R5" V 2393 5550 50  0000 C CNN
F 1 "220R" V 2484 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2530 5550 50  0001 C CNN
F 3 "~" H 2600 5550 50  0001 C CNN
	1    2600 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 5550 2450 5550
Wire Wire Line
	2750 5550 2900 5550
Wire Wire Line
	2300 5850 2900 5850
Wire Wire Line
	2900 5550 3550 5550
Connection ~ 2900 5550
Wire Wire Line
	2900 5850 3350 5850
Wire Wire Line
	3350 5850 3350 5750
Wire Wire Line
	3350 5750 3550 5750
Connection ~ 2900 5850
$Comp
L power:+3.3V #PWR?
U 1 1 6147686D
P 4250 5150
AR Path="/61006ED6/6147686D" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/6147686D" Ref="#PWR090"  Part="1" 
F 0 "#PWR090" H 4250 5000 50  0001 C CNN
F 1 "+3.3V" H 4265 5323 50  0000 C CNN
F 2 "" H 4250 5150 50  0001 C CNN
F 3 "" H 4250 5150 50  0001 C CNN
	1    4250 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61476873
P 4550 5350
AR Path="/61006ED6/61476873" Ref="R?"  Part="1" 
AR Path="/61005BD4/61476873" Ref="R6"  Part="1" 
F 0 "R6" V 4343 5350 50  0000 C CNN
F 1 "10k" V 4434 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4480 5350 50  0001 C CNN
F 3 "~" H 4550 5350 50  0001 C CNN
	1    4550 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 5550 4800 5550
Wire Wire Line
	4800 5350 4800 5550
Connection ~ 4800 5550
Wire Wire Line
	4800 5550 4900 5550
Wire Wire Line
	4700 5350 4800 5350
$Comp
L power:GND #PWR?
U 1 1 6147687E
P 4300 5750
AR Path="/61006ED6/6147687E" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/6147687E" Ref="#PWR091"  Part="1" 
F 0 "#PWR091" H 4300 5500 50  0001 C CNN
F 1 "GND" V 4305 5622 50  0000 R CNN
F 2 "" H 4300 5750 50  0001 C CNN
F 3 "" H 4300 5750 50  0001 C CNN
	1    4300 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 5750 4300 5750
$Comp
L power:+3.3V #PWR?
U 1 1 61476885
P 1100 5400
AR Path="/61006ED6/61476885" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/61476885" Ref="#PWR075"  Part="1" 
F 0 "#PWR075" H 1100 5250 50  0001 C CNN
F 1 "+3.3V" H 1115 5573 50  0000 C CNN
F 2 "" H 1100 5400 50  0001 C CNN
F 3 "" H 1100 5400 50  0001 C CNN
	1    1100 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6147688B
P 1100 5700
AR Path="/61006ED6/6147688B" Ref="#PWR?"  Part="1" 
AR Path="/61005BD4/6147688B" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 1100 5450 50  0001 C CNN
F 1 "GND" H 1105 5527 50  0000 C CNN
F 2 "" H 1100 5700 50  0001 C CNN
F 3 "" H 1100 5700 50  0001 C CNN
	1    1100 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 61476891
P 1100 5550
AR Path="/61006ED6/61476891" Ref="C?"  Part="1" 
AR Path="/61005BD4/61476891" Ref="C3"  Part="1" 
F 0 "C3" H 1215 5596 50  0000 L CNN
F 1 "100n" H 1215 5505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1138 5400 50  0001 C CNN
F 3 "~" H 1100 5550 50  0001 C CNN
	1    1100 5550
	1    0    0    -1  
$EndComp
NoConn ~ 4150 5450
Wire Wire Line
	4150 5350 4250 5350
Wire Wire Line
	4250 5150 4250 5350
Connection ~ 4250 5350
Wire Wire Line
	4250 5350 4400 5350
Text HLabel 2300 5550 0    50   Input ~ 0
midi_in+
Text HLabel 2300 5850 0    50   Input ~ 0
midi_in-
Text GLabel 7850 3500 2    50   Input ~ 0
midi_in
Text GLabel 4900 5550 2    50   Output ~ 0
midi_in
$EndSCHEMATC
