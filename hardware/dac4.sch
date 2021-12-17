EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L power:GND #PWR0115
U 1 1 60A46579
P 4450 5150
F 0 "#PWR0115" H 4450 4900 50  0001 C CNN
F 1 "GND" H 4455 4977 50  0000 C CNN
F 2 "" H 4450 5150 50  0001 C CNN
F 3 "" H 4450 5150 50  0001 C CNN
	1    4450 5150
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3VA #PWR0108
U 1 1 60A46C2F
P 2250 1350
F 0 "#PWR0108" H 2250 1200 50  0001 C CNN
F 1 "+3.3VA" H 2265 1523 50  0000 C CNN
F 2 "" H 2250 1350 50  0001 C CNN
F 3 "" H 2250 1350 50  0001 C CNN
	1    2250 1350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0103
U 1 1 60A4736E
P 1450 1350
F 0 "#PWR0103" H 1450 1200 50  0001 C CNN
F 1 "+3.3V" H 1465 1523 50  0000 C CNN
F 2 "" H 1450 1350 50  0001 C CNN
F 3 "" H 1450 1350 50  0001 C CNN
	1    1450 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 60A48509
P 2250 1850
F 0 "#PWR0109" H 2250 1600 50  0001 C CNN
F 1 "GND" H 2255 1677 50  0000 C CNN
F 2 "" H 2250 1850 50  0001 C CNN
F 3 "" H 2250 1850 50  0001 C CNN
	1    2250 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 60A49BA4
P 2450 1600
F 0 "C19" H 2565 1646 50  0000 L CNN
F 1 "4u7" H 2565 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2488 1450 50  0001 C CNN
F 3 "~" H 2450 1600 50  0001 C CNN
F 4 "C19666" H 2450 1600 50  0001 C CNN "LCSC Part #"
F 5 "C19666" H 2450 1600 50  0001 C CNN "LCSC"
	1    2450 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 60A47B47
P 2050 1600
F 0 "C18" H 1935 1554 50  0000 R CNN
F 1 "100n" H 1935 1645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2088 1450 50  0001 C CNN
F 3 "~" H 2050 1600 50  0001 C CNN
F 4 "C14663" H 2050 1600 50  0001 C CNN "LCSC Part #"
F 5 "C14663" H 2050 1600 50  0001 C CNN "LCSC"
	1    2050 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 1350 2050 1350
Wire Wire Line
	2050 1350 2050 1450
Wire Wire Line
	2250 1350 2450 1350
Wire Wire Line
	2450 1350 2450 1450
Connection ~ 2250 1350
Wire Wire Line
	2250 1850 2450 1850
Wire Wire Line
	2450 1850 2450 1750
Wire Wire Line
	2250 1850 2050 1850
Wire Wire Line
	2050 1850 2050 1750
Connection ~ 2250 1850
$Comp
L power:+3.3VA #PWR0105
U 1 1 60A4E5A0
P 1950 5650
F 0 "#PWR0105" H 1950 5500 50  0001 C CNN
F 1 "+3.3VA" V 1965 5777 50  0000 L CNN
F 2 "" H 1950 5650 50  0001 C CNN
F 3 "" H 1950 5650 50  0001 C CNN
	1    1950 5650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1950 5650 2450 5650
$Comp
L power:GND #PWR0107
U 1 1 60A48919
P 2150 5750
F 0 "#PWR0107" H 2150 5500 50  0001 C CNN
F 1 "GND" V 2155 5622 50  0000 R CNN
F 2 "" H 2150 5750 50  0001 C CNN
F 3 "" H 2150 5750 50  0001 C CNN
	1    2150 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 5750 2300 5750
Wire Wire Line
	2450 5850 2300 5850
Wire Wire Line
	2300 5850 2300 5750
Connection ~ 2300 5750
Wire Wire Line
	2300 5750 2450 5750
Text GLabel 2450 5550 0    50   Output ~ 0
v_ref_dac4
Text GLabel 3000 1350 1    50   Input ~ 0
v_ref_dac4
$Comp
L power:GND #PWR0110
U 1 1 60A528A6
P 3000 1850
F 0 "#PWR0110" H 3000 1600 50  0001 C CNN
F 1 "GND" H 3005 1677 50  0000 C CNN
F 2 "" H 3000 1850 50  0001 C CNN
F 3 "" H 3000 1850 50  0001 C CNN
	1    3000 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 60A52DC8
P 3000 1600
F 0 "C20" H 2885 1554 50  0000 R CNN
F 1 "220n" H 2885 1645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3038 1450 50  0001 C CNN
F 3 "~" H 3000 1600 50  0001 C CNN
F 4 "C21120" H 3000 1600 50  0001 C CNN "LCSC Part #"
F 5 "C21120" H 3000 1600 50  0001 C CNN "LCSC"
	1    3000 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3000 1450 3000 1350
Wire Wire Line
	3000 1750 3000 1850
Wire Wire Line
	4250 5650 4450 5650
Wire Wire Line
	4450 5650 4450 5550
Wire Wire Line
	4250 5550 4450 5550
Connection ~ 4450 5550
Wire Wire Line
	4450 5550 4450 5450
Wire Wire Line
	4250 5450 4450 5450
Connection ~ 4450 5450
Wire Wire Line
	4450 5450 4450 5350
Wire Wire Line
	4250 5350 4450 5350
Connection ~ 4450 5350
Wire Wire Line
	4450 5350 4450 5150
$Comp
L power:+3.3V #PWR0118
U 1 1 60A5711A
P 4650 5750
F 0 "#PWR0118" H 4650 5600 50  0001 C CNN
F 1 "+3.3V" V 4665 5878 50  0000 L CNN
F 2 "" H 4650 5750 50  0001 C CNN
F 3 "" H 4650 5750 50  0001 C CNN
	1    4650 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 5750 4650 5750
$Comp
L Device:C C17
U 1 1 60A5A041
P 1450 1600
F 0 "C17" H 1335 1554 50  0000 R CNN
F 1 "100n" H 1335 1645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1488 1450 50  0001 C CNN
F 3 "~" H 1450 1600 50  0001 C CNN
F 4 "C14663" H 1450 1600 50  0001 C CNN "LCSC Part #"
F 5 "C14663" H 1450 1600 50  0001 C CNN "LCSC"
	1    1450 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	1450 1450 1450 1350
$Comp
L power:GND #PWR0104
U 1 1 60A5AAE5
P 1450 1850
F 0 "#PWR0104" H 1450 1600 50  0001 C CNN
F 1 "GND" H 1455 1677 50  0000 C CNN
F 2 "" H 1450 1850 50  0001 C CNN
F 3 "" H 1450 1850 50  0001 C CNN
	1    1450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1850 1450 1750
Text HLabel 4250 5850 2    50   Input ~ 0
dac4_din
Text HLabel 4250 5950 2    50   Input ~ 0
dac4_clk
$Comp
L DAC8564IAPW:DAC8564IAPW IC3
U 1 1 60A446BC
P 2450 5350
F 0 "IC3" H 3350 5615 50  0000 C CNN
F 1 "DAC8564IAPW" H 3350 5524 50  0000 C CNN
F 2 "SOP65P640X120-16N" H 4100 5450 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/dac8564" H 4100 5350 50  0001 L CNN
F 4 "16-Bit, Quad Channel, Ultra-Low Glitch, Voltage Output DAC with 2.5V, 2ppm/C Internal Reference" H 4100 5250 50  0001 L CNN "Description"
F 5 "1.2" H 4100 5150 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 4100 5050 50  0001 L CNN "Manufacturer_Name"
F 7 "DAC8564IAPW" H 4100 4950 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-DAC8564IAPW" H 4100 4850 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/DAC8564IAPW?qs=xL7PkI2RoJ7hkn2IPLSbKw%3D%3D" H 4100 4750 50  0001 L CNN "Mouser Price/Stock"
F 10 "DAC8564IAPW" H 4100 4650 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/dac8564iapw/texas-instruments" H 4100 4550 50  0001 L CNN "Arrow Price/Stock"
F 12 "C1554750" H 2450 5350 50  0001 C CNN "LCSC Part #"
F 13 "C1554750" H 2450 5350 50  0001 C CNN "LCSC"
	1    2450 5350
	1    0    0    -1  
$EndComp
Text HLabel 4250 6050 2    50   Input ~ 0
dac4_cs
$Comp
L Device:R R11
U 1 1 60AB1391
P 7050 1100
F 0 "R11" V 7257 1100 50  0000 C CNN
F 1 "33k" V 7166 1100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6980 1100 50  0001 C CNN
F 3 "~" H 7050 1100 50  0001 C CNN
F 4 "C4216" H 7050 1100 50  0001 C CNN "LCSC Part #"
F 5 "C4216" H 7050 1100 50  0001 C CNN "LCSC"
	1    7050 1100
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U4
U 1 1 60AB805F
P 8250 1000
F 0 "U4" H 8250 633 50  0000 C CNN
F 1 "OPA4172" H 8250 724 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8200 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8300 1200 50  0001 C CNN
	1    8250 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 60ABEA8C
P 8850 1000
F 0 "R19" V 9057 1000 50  0000 C CNN
F 1 "1k" V 8966 1000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8780 1000 50  0001 C CNN
F 3 "~" H 8850 1000 50  0001 C CNN
F 4 "C21190" H 8850 1000 50  0001 C CNN "LCSC Part #"
F 5 "C21190" H 8850 1000 50  0001 C CNN "LCSC"
	1    8850 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 1000 8600 1000
Wire Wire Line
	9100 1900 8350 1900
$Comp
L Device:R R15
U 1 1 60AC1771
P 8200 1900
F 0 "R15" V 8407 1900 50  0000 C CNN
F 1 "180k" V 8316 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8130 1900 50  0001 C CNN
F 3 "~" H 8200 1900 50  0001 C CNN
F 4 "C22827" H 8200 1900 50  0001 C CNN "LCSC Part #"
F 5 "C22827" H 8200 1900 50  0001 C CNN "LCSC"
	1    8200 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 1100 6500 1100
Wire Wire Line
	8050 1900 7600 1900
Text GLabel 7950 900  0    50   Input ~ 0
ref_dac4
Text GLabel 6500 1100 0    50   Input ~ 0
v_out_dac4_a
$Comp
L Amplifier_Operational:TL074 U4
U 5 1 60B3E5CF
P 4150 3700
F 0 "U4" H 4108 3746 50  0000 L CNN
F 1 "OPA4172" H 4108 3655 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 4100 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 4200 3900 50  0001 C CNN
	5    4150 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 60AB051B
P 2050 4000
F 0 "R10" H 1980 3954 50  0000 R CNN
F 1 "36k" H 1980 4045 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1980 4000 50  0001 C CNN
F 3 "~" H 2050 4000 50  0001 C CNN
F 4 "C23147" H 2050 4000 50  0001 C CNN "LCSC Part #"
F 5 "C23147" H 2050 4000 50  0001 C CNN "LCSC"
	1    2050 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2050 4150 2050 4250
$Comp
L Device:R R9
U 1 1 60AB3DD3
P 2050 3400
F 0 "R9" H 2120 3446 50  0000 L CNN
F 1 "33k" H 2120 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1980 3400 50  0001 C CNN
F 3 "~" H 2050 3400 50  0001 C CNN
F 4 "C4216" H 2050 3400 50  0001 C CNN "LCSC Part #"
F 5 "C4216" H 2050 3400 50  0001 C CNN "LCSC"
	1    2050 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60B20046
P 2050 4250
F 0 "#PWR0106" H 2050 4000 50  0001 C CNN
F 1 "GND" H 2055 4077 50  0000 C CNN
F 2 "" H 2050 4250 50  0001 C CNN
F 3 "" H 2050 4250 50  0001 C CNN
	1    2050 4250
	1    0    0    -1  
$EndComp
Text GLabel 2050 3150 1    50   Input ~ 0
v_ref_dac4
Wire Wire Line
	2050 3700 2050 3550
Connection ~ 2050 3700
Wire Wire Line
	2050 3700 2300 3700
Text GLabel 2300 3700 2    50   Output ~ 0
ref_dac4
Wire Wire Line
	2050 3850 2050 3700
$Comp
L Device:C C21
U 1 1 60B61C5A
P 3950 1600
F 0 "C21" H 3835 1554 50  0000 R CNN
F 1 "100n" H 3835 1645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3988 1450 50  0001 C CNN
F 3 "~" H 3950 1600 50  0001 C CNN
F 4 "C14663" H 3950 1600 50  0001 C CNN "LCSC Part #"
F 5 "C14663" H 3950 1600 50  0001 C CNN "LCSC"
	1    3950 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 1450 3950 1350
$Comp
L power:GND #PWR0112
U 1 1 60B61C61
P 3950 1850
F 0 "#PWR0112" H 3950 1600 50  0001 C CNN
F 1 "GND" H 3955 1677 50  0000 C CNN
F 2 "" H 3950 1850 50  0001 C CNN
F 3 "" H 3950 1850 50  0001 C CNN
	1    3950 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1850 3950 1750
$Comp
L Device:C C22
U 1 1 60B68A3D
P 4600 1600
F 0 "C22" H 4485 1554 50  0000 R CNN
F 1 "100n" H 4485 1645 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4638 1450 50  0001 C CNN
F 3 "~" H 4600 1600 50  0001 C CNN
F 4 "C14663" H 4600 1600 50  0001 C CNN "LCSC Part #"
F 5 "C14663" H 4600 1600 50  0001 C CNN "LCSC"
	1    4600 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	4600 1450 4600 1350
$Comp
L power:GND #PWR0117
U 1 1 60B68A44
P 4600 1850
F 0 "#PWR0117" H 4600 1600 50  0001 C CNN
F 1 "GND" H 4605 1677 50  0000 C CNN
F 2 "" H 4600 1850 50  0001 C CNN
F 3 "" H 4600 1850 50  0001 C CNN
	1    4600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1850 4600 1750
Text Notes 9300 900  0    50   ~ 0
-5.2V to 8.4V
Wire Wire Line
	9000 1000 9100 1000
Wire Wire Line
	7200 1100 7600 1100
Wire Wire Line
	7600 1100 7600 1500
Connection ~ 7600 1100
Wire Wire Line
	7600 1100 7950 1100
Wire Wire Line
	9100 1000 9100 1900
Connection ~ 9100 1000
Wire Wire Line
	9100 1000 9350 1000
$Comp
L Device:C C23
U 1 1 60CD488D
P 7950 1500
F 0 "C23" H 7835 1454 50  0000 R CNN
F 1 "22p" H 7835 1545 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7988 1350 50  0001 C CNN
F 3 "~" H 7950 1500 50  0001 C CNN
F 4 "C1653" H 7950 1500 50  0001 C CNN "LCSC Part #"
F 5 "C1653" H 7950 1500 50  0001 C CNN "LCSC"
	1    7950 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 1500 7800 1500
Connection ~ 7600 1500
Wire Wire Line
	7600 1500 7600 1900
Wire Wire Line
	8100 1500 8600 1500
Wire Wire Line
	8600 1500 8600 1000
Connection ~ 8600 1000
Wire Wire Line
	8600 1000 8550 1000
$Comp
L Device:R R13
U 1 1 60CF3357
P 7100 2500
F 0 "R13" V 7307 2500 50  0000 C CNN
F 1 "33k" V 7216 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7030 2500 50  0001 C CNN
F 3 "~" H 7100 2500 50  0001 C CNN
F 4 "C4216" H 7100 2500 50  0001 C CNN "LCSC Part #"
F 5 "C4216" H 7100 2500 50  0001 C CNN "LCSC"
	1    7100 2500
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U4
U 2 1 60CF335D
P 8300 2400
F 0 "U4" H 8300 2033 50  0000 C CNN
F 1 "OPA4172" H 8300 2124 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8250 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8350 2600 50  0001 C CNN
	2    8300 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R21
U 1 1 60CF3363
P 8900 2400
F 0 "R21" V 9107 2400 50  0000 C CNN
F 1 "1k" V 9016 2400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8830 2400 50  0001 C CNN
F 3 "~" H 8900 2400 50  0001 C CNN
F 4 "C21190" H 8900 2400 50  0001 C CNN "LCSC Part #"
F 5 "C21190" H 8900 2400 50  0001 C CNN "LCSC"
	1    8900 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 2400 8650 2400
Wire Wire Line
	9150 3300 8400 3300
$Comp
L Device:R R17
U 1 1 60CF336B
P 8250 3300
F 0 "R17" V 8457 3300 50  0000 C CNN
F 1 "180k" V 8366 3300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8180 3300 50  0001 C CNN
F 3 "~" H 8250 3300 50  0001 C CNN
F 4 "C22827" H 8250 3300 50  0001 C CNN "LCSC Part #"
F 5 "C22827" H 8250 3300 50  0001 C CNN "LCSC"
	1    8250 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 2500 6550 2500
Wire Wire Line
	8100 3300 7650 3300
Text GLabel 8000 2300 0    50   Input ~ 0
ref_dac4
Text GLabel 6550 2500 0    50   Input ~ 0
v_out_dac4_d
Text Notes 9350 2300 0    50   ~ 0
-5.2V to 8.4V
Wire Wire Line
	9050 2400 9150 2400
Wire Wire Line
	7250 2500 7650 2500
Wire Wire Line
	7650 2500 7650 2900
Connection ~ 7650 2500
Wire Wire Line
	7650 2500 8000 2500
Wire Wire Line
	9150 2400 9150 3300
Connection ~ 9150 2400
Wire Wire Line
	9150 2400 9400 2400
$Comp
L Device:C C25
U 1 1 60CF337F
P 8000 2900
F 0 "C25" H 7885 2854 50  0000 R CNN
F 1 "22p" H 7885 2945 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8038 2750 50  0001 C CNN
F 3 "~" H 8000 2900 50  0001 C CNN
F 4 "C1653" H 8000 2900 50  0001 C CNN "LCSC Part #"
F 5 "C1653" H 8000 2900 50  0001 C CNN "LCSC"
	1    8000 2900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 2900 7850 2900
Connection ~ 7650 2900
Wire Wire Line
	7650 2900 7650 3300
Wire Wire Line
	8150 2900 8650 2900
Wire Wire Line
	8650 2900 8650 2400
Connection ~ 8650 2400
Wire Wire Line
	8650 2400 8600 2400
$Comp
L Device:R R14
U 1 1 60CF464C
P 7100 3900
F 0 "R14" V 7307 3900 50  0000 C CNN
F 1 "33k" V 7216 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 7030 3900 50  0001 C CNN
F 3 "~" H 7100 3900 50  0001 C CNN
F 4 "C4216" H 7100 3900 50  0001 C CNN "LCSC Part #"
F 5 "C4216" H 7100 3900 50  0001 C CNN "LCSC"
	1    7100 3900
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U4
U 3 1 60CF4652
P 8300 3800
F 0 "U4" H 8300 3433 50  0000 C CNN
F 1 "OPA4172" H 8300 3524 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8250 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8350 4000 50  0001 C CNN
	3    8300 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 60CF4658
P 8900 3800
F 0 "R22" V 9107 3800 50  0000 C CNN
F 1 "1k" V 9016 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8830 3800 50  0001 C CNN
F 3 "~" H 8900 3800 50  0001 C CNN
F 4 "C21190" H 8900 3800 50  0001 C CNN "LCSC Part #"
F 5 "C21190" H 8900 3800 50  0001 C CNN "LCSC"
	1    8900 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 3800 8650 3800
Wire Wire Line
	9150 4700 8400 4700
$Comp
L Device:R R18
U 1 1 60CF4660
P 8250 4700
F 0 "R18" V 8457 4700 50  0000 C CNN
F 1 "180k" V 8366 4700 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8180 4700 50  0001 C CNN
F 3 "~" H 8250 4700 50  0001 C CNN
F 4 "C22827" H 8250 4700 50  0001 C CNN "LCSC Part #"
F 5 "C22827" H 8250 4700 50  0001 C CNN "LCSC"
	1    8250 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 3900 6550 3900
Wire Wire Line
	8100 4700 7650 4700
Text GLabel 8000 3700 0    50   Input ~ 0
ref_dac4
Text GLabel 6550 3900 0    50   Input ~ 0
v_out_dac4_c
Text Notes 9350 3700 0    50   ~ 0
-5.2V to 8.4V
Wire Wire Line
	9050 3800 9150 3800
Wire Wire Line
	7250 3900 7650 3900
Wire Wire Line
	7650 3900 7650 4300
Connection ~ 7650 3900
Wire Wire Line
	7650 3900 8000 3900
Wire Wire Line
	9150 3800 9150 4700
Connection ~ 9150 3800
Wire Wire Line
	9150 3800 9400 3800
$Comp
L Device:C C26
U 1 1 60CF4674
P 8000 4300
F 0 "C26" H 7885 4254 50  0000 R CNN
F 1 "22p" H 7885 4345 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8038 4150 50  0001 C CNN
F 3 "~" H 8000 4300 50  0001 C CNN
F 4 "C1653" H 8000 4300 50  0001 C CNN "LCSC Part #"
F 5 "C1653" H 8000 4300 50  0001 C CNN "LCSC"
	1    8000 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7650 4300 7850 4300
Connection ~ 7650 4300
Wire Wire Line
	7650 4300 7650 4700
Wire Wire Line
	8150 4300 8650 4300
Wire Wire Line
	8650 4300 8650 3800
Connection ~ 8650 3800
Wire Wire Line
	8650 3800 8600 3800
$Comp
L Device:R R12
U 1 1 60CF871F
P 7050 5300
F 0 "R12" V 7257 5300 50  0000 C CNN
F 1 "33k" V 7166 5300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6980 5300 50  0001 C CNN
F 3 "~" H 7050 5300 50  0001 C CNN
F 4 "C4216" H 7050 5300 50  0001 C CNN "LCSC Part #"
F 5 "C4216" H 7050 5300 50  0001 C CNN "LCSC"
	1    7050 5300
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U4
U 4 1 60CF8725
P 8250 5200
F 0 "U4" H 8250 4833 50  0000 C CNN
F 1 "OPA4172" H 8250 4924 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8200 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 8300 5400 50  0001 C CNN
	4    8250 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 60CF872B
P 8850 5200
F 0 "R20" V 9057 5200 50  0000 C CNN
F 1 "1k" V 8966 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8780 5200 50  0001 C CNN
F 3 "~" H 8850 5200 50  0001 C CNN
F 4 "C21190" H 8850 5200 50  0001 C CNN "LCSC Part #"
F 5 "C21190" H 8850 5200 50  0001 C CNN "LCSC"
	1    8850 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 5200 8600 5200
Wire Wire Line
	9100 6100 8350 6100
$Comp
L Device:R R16
U 1 1 60CF8733
P 8200 6100
F 0 "R16" V 8407 6100 50  0000 C CNN
F 1 "180k" V 8316 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8130 6100 50  0001 C CNN
F 3 "~" H 8200 6100 50  0001 C CNN
F 4 "C22827" H 8200 6100 50  0001 C CNN "LCSC Part #"
F 5 "C22827" H 8200 6100 50  0001 C CNN "LCSC"
	1    8200 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 5300 6500 5300
Wire Wire Line
	8050 6100 7600 6100
Text GLabel 7950 5100 0    50   Input ~ 0
ref_dac4
Text GLabel 6500 5300 0    50   Input ~ 0
v_out_dac4_b
Text Notes 9300 5100 0    50   ~ 0
-5.2V to 8.4V
Wire Wire Line
	9000 5200 9100 5200
Wire Wire Line
	7200 5300 7600 5300
Wire Wire Line
	7600 5300 7600 5700
Connection ~ 7600 5300
Wire Wire Line
	7600 5300 7950 5300
Wire Wire Line
	9100 5200 9100 6100
Connection ~ 9100 5200
Wire Wire Line
	9100 5200 9350 5200
$Comp
L Device:C C24
U 1 1 60CF8747
P 7950 5700
F 0 "C24" H 7835 5654 50  0000 R CNN
F 1 "22p" H 7835 5745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7988 5550 50  0001 C CNN
F 3 "~" H 7950 5700 50  0001 C CNN
F 4 "C1653" H 7950 5700 50  0001 C CNN "LCSC Part #"
F 5 "C1653" H 7950 5700 50  0001 C CNN "LCSC"
	1    7950 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7600 5700 7800 5700
Connection ~ 7600 5700
Wire Wire Line
	7600 5700 7600 6100
Wire Wire Line
	8100 5700 8600 5700
Wire Wire Line
	8600 5700 8600 5200
Connection ~ 8600 5200
Wire Wire Line
	8600 5200 8550 5200
Text GLabel 2450 5350 0    50   Output ~ 0
v_out_dac4_a
Text GLabel 2450 5450 0    50   Output ~ 0
v_out_dac4_b
Text GLabel 2450 5950 0    50   Output ~ 0
v_out_dac4_c
Text GLabel 2450 6050 0    50   Output ~ 0
v_out_dac4_d
Text HLabel 9350 1000 2    50   Output ~ 0
dac4_out_a
Text HLabel 9400 2400 2    50   Output ~ 0
dac4_out_d
Text HLabel 9400 3800 2    50   Output ~ 0
dac4_out_c
Text HLabel 9350 5200 2    50   Output ~ 0
dac4_out_b
Text HLabel 3350 1450 2    50   Output ~ 0
v_ref
Wire Wire Line
	2050 3150 2050 3250
Wire Wire Line
	3000 1450 3350 1450
Connection ~ 3000 1450
$Comp
L power:VCC #PWR0111
U 1 1 611B727E
P 3950 1350
F 0 "#PWR0111" H 3950 1200 50  0001 C CNN
F 1 "VCC" H 3965 1523 50  0000 C CNN
F 2 "" H 3950 1350 50  0001 C CNN
F 3 "" H 3950 1350 50  0001 C CNN
	1    3950 1350
	1    0    0    -1  
$EndComp
$Comp
L power:VEE #PWR0116
U 1 1 611B8584
P 4600 1350
F 0 "#PWR0116" H 4600 1200 50  0001 C CNN
F 1 "VEE" H 4615 1523 50  0000 C CNN
F 2 "" H 4600 1350 50  0001 C CNN
F 3 "" H 4600 1350 50  0001 C CNN
	1    4600 1350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0113
U 1 1 611B9B4A
P 4050 3400
F 0 "#PWR0113" H 4050 3250 50  0001 C CNN
F 1 "VCC" H 4065 3573 50  0000 C CNN
F 2 "" H 4050 3400 50  0001 C CNN
F 3 "" H 4050 3400 50  0001 C CNN
	1    4050 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VEE #PWR0114
U 1 1 611BA2F7
P 4050 4000
F 0 "#PWR0114" H 4050 3850 50  0001 C CNN
F 1 "VEE" H 4065 4173 50  0000 C CNN
F 2 "" H 4050 4000 50  0001 C CNN
F 3 "" H 4050 4000 50  0001 C CNN
	1    4050 4000
	-1   0    0    1   
$EndComp
$EndSCHEMATC
