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
P 1800 6250
F 0 "IC?" H 2650 6515 50  0000 C CNN
F 1 "DAC5578SPWR" H 2650 6424 50  0000 C CNN
F 2 "SOP65P640X120-16N" H 3350 6350 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/DAC5578" H 3350 6250 50  0001 L CNN
F 4 "8-bit, Octal Channel, Ultra-Low Glitch, Voltage Output, 2-Wire Interface DAC" H 3350 6150 50  0001 L CNN "Description"
F 5 "" H 3350 6050 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 3350 5950 50  0001 L CNN "Manufacturer_Name"
F 7 "DAC5578SPWR" H 3350 5850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-DAC5578SPWR" H 3350 5750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/DAC5578SPWR?qs=EuM%2FBx4ov4S16BMU6rn1hg%3D%3D" H 3350 5650 50  0001 L CNN "Mouser Price/Stock"
F 10 "DAC5578SPWR" H 3350 5550 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/dac5578spwr/texas-instruments" H 3350 5450 50  0001 L CNN "Arrow Price/Stock"
	1    1800 6250
	1    0    0    -1  
$EndComp
Text GLabel 1800 6950 0    50   Input ~ 0
v_ref_dac
$Comp
L power:+3.3VA #PWR?
U 1 1 60A68DBC
P 1300 6450
F 0 "#PWR?" H 1300 6300 50  0001 C CNN
F 1 "+3.3VA" V 1315 6577 50  0000 L CNN
F 2 "" H 1300 6450 50  0001 C CNN
F 3 "" H 1300 6450 50  0001 C CNN
	1    1300 6450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1300 6450 1800 6450
Wire Wire Line
	1800 6350 1650 6350
Wire Wire Line
	1650 6250 1800 6250
Wire Wire Line
	1500 6250 1650 6250
Connection ~ 1650 6250
Wire Wire Line
	1650 6350 1650 6250
$Comp
L power:GND #PWR?
U 1 1 60A68DC3
P 1500 6250
AR Path="/60A48B70/60A68DC3" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A68DC3" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1500 6000 50  0001 C CNN
F 1 "GND" V 1505 6122 50  0000 R CNN
F 2 "" H 1500 6250 50  0001 C CNN
F 3 "" H 1500 6250 50  0001 C CNN
	1    1500 6250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60A6D04A
P 4150 6450
AR Path="/60A48B70/60A6D04A" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A6D04A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 4150 6200 50  0001 C CNN
F 1 "GND" V 4155 6322 50  0000 R CNN
F 2 "" H 4150 6450 50  0001 C CNN
F 3 "" H 4150 6450 50  0001 C CNN
	1    4150 6450
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 60A6DE0B
P 3600 7350
AR Path="/60A48B70/60A6DE0B" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60A6DE0B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3600 7200 50  0001 C CNN
F 1 "+3.3V" H 3615 7523 50  0000 C CNN
F 2 "" H 3600 7350 50  0001 C CNN
F 3 "" H 3600 7350 50  0001 C CNN
	1    3600 7350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 60A6F434
P 3600 7200
F 0 "R?" H 3530 7154 50  0000 R CNN
F 1 "10k" H 3530 7245 50  0000 R CNN
F 2 "" V 3530 7200 50  0001 C CNN
F 3 "~" H 3600 7200 50  0001 C CNN
	1    3600 7200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3500 6950 3600 6950
Wire Wire Line
	3600 6950 3600 7050
Text HLabel 3500 6250 2    50   BiDi ~ 0
dac8_scl
Text HLabel 3500 6350 2    50   BiDi ~ 0
dac8_sda
Wire Wire Line
	3500 6450 4150 6450
$Comp
L power:+3.3VA #PWR?
U 1 1 60BC221F
P 1450 950
AR Path="/60A48B70/60BC221F" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC221F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1450 800 50  0001 C CNN
F 1 "+3.3VA" H 1465 1123 50  0000 C CNN
F 2 "" H 1450 950 50  0001 C CNN
F 3 "" H 1450 950 50  0001 C CNN
	1    1450 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60BC222B
P 1450 1450
AR Path="/60A48B70/60BC222B" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC222B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1450 1200 50  0001 C CNN
F 1 "GND" H 1455 1277 50  0000 C CNN
F 2 "" H 1450 1450 50  0001 C CNN
F 3 "" H 1450 1450 50  0001 C CNN
	1    1450 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60BC2231
P 1650 1200
AR Path="/60A48B70/60BC2231" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60BC2231" Ref="C?"  Part="1" 
F 0 "C?" H 1765 1246 50  0000 L CNN
F 1 "3.3u" H 1765 1155 50  0000 L CNN
F 2 "" H 1688 1050 50  0001 C CNN
F 3 "~" H 1650 1200 50  0001 C CNN
	1    1650 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60BC2237
P 1250 1200
AR Path="/60A48B70/60BC2237" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60BC2237" Ref="C?"  Part="1" 
F 0 "C?" H 1135 1154 50  0000 R CNN
F 1 "100n" H 1135 1245 50  0000 R CNN
F 2 "" H 1288 1050 50  0001 C CNN
F 3 "~" H 1250 1200 50  0001 C CNN
	1    1250 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1450 950  1250 950 
Wire Wire Line
	1250 950  1250 1050
Wire Wire Line
	1450 950  1650 950 
Wire Wire Line
	1650 950  1650 1050
Connection ~ 1450 950 
Wire Wire Line
	1450 1450 1650 1450
Wire Wire Line
	1650 1450 1650 1350
Wire Wire Line
	1450 1450 1250 1450
Wire Wire Line
	1250 1450 1250 1350
Connection ~ 1450 1450
$Comp
L Device:R R?
U 1 1 60BC2264
P 4050 1200
AR Path="/60A48B70/60BC2264" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC2264" Ref="R?"  Part="1" 
F 0 "R?" V 3843 1200 50  0000 C CNN
F 1 "36k" V 3934 1200 50  0000 C CNN
F 2 "" V 3980 1200 50  0001 C CNN
F 3 "~" H 4050 1200 50  0001 C CNN
	1    4050 1200
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 1 1 60BC226A
P 5250 1100
AR Path="/60A48B70/60BC226A" Ref="U?"  Part="1" 
AR Path="/60A5BF82/60BC226A" Ref="U?"  Part="1" 
F 0 "U?" H 5250 1467 50  0000 C CNN
F 1 "TL074" H 5250 1376 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5200 1200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5300 1300 50  0001 C CNN
	1    5250 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BC2270
P 5850 1100
AR Path="/60A48B70/60BC2270" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC2270" Ref="R?"  Part="1" 
F 0 "R?" V 6057 1100 50  0000 C CNN
F 1 "1k" V 5966 1100 50  0000 C CNN
F 2 "" V 5780 1100 50  0001 C CNN
F 3 "~" H 5850 1100 50  0001 C CNN
	1    5850 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 1100 5600 1100
Wire Wire Line
	6100 1900 5350 1900
$Comp
L Device:R R?
U 1 1 60BC227A
P 5200 1900
AR Path="/60A48B70/60BC227A" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC227A" Ref="R?"  Part="1" 
F 0 "R?" V 4993 1900 50  0000 C CNN
F 1 "150k" V 5084 1900 50  0000 C CNN
F 2 "" V 5130 1900 50  0001 C CNN
F 3 "~" H 5200 1900 50  0001 C CNN
	1    5200 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 1200 3500 1200
Wire Wire Line
	5050 1900 4600 1900
Text GLabel 6350 1100 2    50   Input ~ 0
mod_out_a
Text GLabel 4950 1000 0    50   Input ~ 0
ref_dac8
Text GLabel 3500 1200 0    50   Input ~ 0
v_out_dac8_a
$Comp
L Device:R R?
U 1 1 60BC228B
P 4050 2600
AR Path="/60A48B70/60BC228B" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC228B" Ref="R?"  Part="1" 
F 0 "R?" V 3843 2600 50  0000 C CNN
F 1 "36k" V 3934 2600 50  0000 C CNN
F 2 "" V 3980 2600 50  0001 C CNN
F 3 "~" H 4050 2600 50  0001 C CNN
	1    4050 2600
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 2 1 60BC2291
P 5250 2500
AR Path="/60A48B70/60BC2291" Ref="U?"  Part="2" 
AR Path="/60A5BF82/60BC2291" Ref="U?"  Part="2" 
F 0 "U?" H 5250 2867 50  0000 C CNN
F 1 "TL074" H 5250 2776 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5200 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5300 2700 50  0001 C CNN
	2    5250 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BC2297
P 5850 2500
AR Path="/60A48B70/60BC2297" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC2297" Ref="R?"  Part="1" 
F 0 "R?" V 6057 2500 50  0000 C CNN
F 1 "1k" V 5966 2500 50  0000 C CNN
F 2 "" V 5780 2500 50  0001 C CNN
F 3 "~" H 5850 2500 50  0001 C CNN
	1    5850 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 2500 5600 2500
Wire Wire Line
	3900 2600 3500 2600
Text GLabel 6350 2500 2    50   Input ~ 0
mod_out_b
Text GLabel 4950 2400 0    50   Input ~ 0
ref_dac8
Text GLabel 3500 2600 0    50   Input ~ 0
v_out_dac8_b
$Comp
L Device:R R?
U 1 1 60BC22B2
P 4050 4000
AR Path="/60A48B70/60BC22B2" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC22B2" Ref="R?"  Part="1" 
F 0 "R?" V 3843 4000 50  0000 C CNN
F 1 "36k" V 3934 4000 50  0000 C CNN
F 2 "" V 3980 4000 50  0001 C CNN
F 3 "~" H 4050 4000 50  0001 C CNN
	1    4050 4000
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 3 1 60BC22B8
P 5250 3900
AR Path="/60A48B70/60BC22B8" Ref="U?"  Part="3" 
AR Path="/60A5BF82/60BC22B8" Ref="U?"  Part="3" 
F 0 "U?" H 5250 4267 50  0000 C CNN
F 1 "TL074" H 5250 4176 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5200 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5300 4100 50  0001 C CNN
	3    5250 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60BC22BE
P 5850 3900
AR Path="/60A48B70/60BC22BE" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC22BE" Ref="R?"  Part="1" 
F 0 "R?" V 6057 3900 50  0000 C CNN
F 1 "1k" V 5966 3900 50  0000 C CNN
F 2 "" V 5780 3900 50  0001 C CNN
F 3 "~" H 5850 3900 50  0001 C CNN
	1    5850 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 3900 5600 3900
Wire Wire Line
	3900 4000 3500 4000
Text GLabel 6350 3900 2    50   Input ~ 0
mod_out_c
Text GLabel 4950 3800 0    50   Input ~ 0
ref_dac8
Text GLabel 3500 4000 0    50   Input ~ 0
v_out_dac8_c
$Comp
L Amplifier_Operational:TL074 U?
U 5 1 60BC22D9
P 2000 4850
AR Path="/60A48B70/60BC22D9" Ref="U?"  Part="5" 
AR Path="/60A5BF82/60BC22D9" Ref="U?"  Part="5" 
F 0 "U?" H 1958 4896 50  0000 L CNN
F 1 "TL074" H 1958 4805 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 1950 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2050 5050 50  0001 C CNN
	5    2000 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 60BC22DF
P 1900 4550
AR Path="/60A48B70/60BC22DF" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC22DF" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1900 4400 50  0001 C CNN
F 1 "+12V" H 1915 4723 50  0000 C CNN
F 2 "" H 1900 4550 50  0001 C CNN
F 3 "" H 1900 4550 50  0001 C CNN
	1    1900 4550
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR?
U 1 1 60BC22E5
P 1900 5150
AR Path="/60A48B70/60BC22E5" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC22E5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1900 5250 50  0001 C CNN
F 1 "-12V" H 1915 5323 50  0000 C CNN
F 2 "" H 1900 5150 50  0001 C CNN
F 3 "" H 1900 5150 50  0001 C CNN
	1    1900 5150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 60BC22EB
P 850 5150
AR Path="/60A48B70/60BC22EB" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC22EB" Ref="R?"  Part="1" 
F 0 "R?" H 780 5104 50  0000 R CNN
F 1 "22k" H 780 5195 50  0000 R CNN
F 2 "" V 780 5150 50  0001 C CNN
F 3 "~" H 850 5150 50  0001 C CNN
	1    850  5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	850  5300 850  5400
$Comp
L Device:R R?
U 1 1 60BC22F2
P 850 4550
AR Path="/60A48B70/60BC22F2" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60BC22F2" Ref="R?"  Part="1" 
F 0 "R?" H 920 4596 50  0000 L CNN
F 1 "33k" H 920 4505 50  0000 L CNN
F 2 "" V 780 4550 50  0001 C CNN
F 3 "~" H 850 4550 50  0001 C CNN
	1    850  4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  4300 850  4400
$Comp
L power:GND #PWR?
U 1 1 60BC22F9
P 850 5400
AR Path="/60A48B70/60BC22F9" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC22F9" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 5150 50  0001 C CNN
F 1 "GND" H 855 5227 50  0000 C CNN
F 2 "" H 850 5400 50  0001 C CNN
F 3 "" H 850 5400 50  0001 C CNN
	1    850  5400
	1    0    0    -1  
$EndComp
Text GLabel 850  4300 1    50   Input ~ 0
v_ref
Wire Wire Line
	850  4850 850  4700
Connection ~ 850  4850
Wire Wire Line
	850  4850 1100 4850
Text GLabel 1100 4850 2    50   Input ~ 0
ref_dac8
Wire Wire Line
	850  5000 850  4850
$Comp
L Device:C C?
U 1 1 60BC2305
P 850 2800
AR Path="/60A48B70/60BC2305" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60BC2305" Ref="C?"  Part="1" 
F 0 "C?" H 735 2754 50  0000 R CNN
F 1 "100n" H 735 2845 50  0000 R CNN
F 2 "" H 888 2650 50  0001 C CNN
F 3 "~" H 850 2800 50  0001 C CNN
	1    850  2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	850  2650 850  2550
$Comp
L power:GND #PWR?
U 1 1 60BC230C
P 850 3050
AR Path="/60A48B70/60BC230C" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC230C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 2800 50  0001 C CNN
F 1 "GND" H 855 2877 50  0000 C CNN
F 2 "" H 850 3050 50  0001 C CNN
F 3 "" H 850 3050 50  0001 C CNN
	1    850  3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  3050 850  2950
$Comp
L power:+12V #PWR?
U 1 1 60BC2313
P 850 2550
AR Path="/60A48B70/60BC2313" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC2313" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 850 2400 50  0001 C CNN
F 1 "+12V" H 865 2723 50  0000 C CNN
F 2 "" H 850 2550 50  0001 C CNN
F 3 "" H 850 2550 50  0001 C CNN
	1    850  2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60BC2319
P 1350 2800
AR Path="/60A48B70/60BC2319" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60BC2319" Ref="C?"  Part="1" 
F 0 "C?" H 1235 2754 50  0000 R CNN
F 1 "100n" H 1235 2845 50  0000 R CNN
F 2 "" H 1388 2650 50  0001 C CNN
F 3 "~" H 1350 2800 50  0001 C CNN
	1    1350 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 2650 1350 2550
$Comp
L power:GND #PWR?
U 1 1 60BC2320
P 1350 3050
AR Path="/60A48B70/60BC2320" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC2320" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 2800 50  0001 C CNN
F 1 "GND" H 1355 2877 50  0000 C CNN
F 2 "" H 1350 3050 50  0001 C CNN
F 3 "" H 1350 3050 50  0001 C CNN
	1    1350 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3050 1350 2950
$Comp
L power:-12V #PWR?
U 1 1 60BC2327
P 1350 2550
AR Path="/60A48B70/60BC2327" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60BC2327" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 2650 50  0001 C CNN
F 1 "-12V" H 1365 2723 50  0000 C CNN
F 2 "" H 1350 2550 50  0001 C CNN
F 3 "" H 1350 2550 50  0001 C CNN
	1    1350 2550
	1    0    0    -1  
$EndComp
Text Notes 6300 1000 0    50   ~ 0
-5.2V to 5.2V
Text Notes 6300 2400 0    50   ~ 0
-5.2V to 5.2V
Text Notes 6300 3800 0    50   ~ 0
-5.2V to 5.2V
$Comp
L Device:R R?
U 1 1 60C1C91E
P 4050 5450
AR Path="/60A48B70/60C1C91E" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C1C91E" Ref="R?"  Part="1" 
F 0 "R?" V 3843 5450 50  0000 C CNN
F 1 "36k" V 3934 5450 50  0000 C CNN
F 2 "" V 3980 5450 50  0001 C CNN
F 3 "~" H 4050 5450 50  0001 C CNN
	1    4050 5450
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 4 1 60C1C924
P 5250 5350
AR Path="/60A48B70/60C1C924" Ref="U?"  Part="3" 
AR Path="/60A5BF82/60C1C924" Ref="U?"  Part="4" 
F 0 "U?" H 5250 5717 50  0000 C CNN
F 1 "TL074" H 5250 5626 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5200 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 5300 5550 50  0001 C CNN
	4    5250 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60C1C92A
P 5850 5350
AR Path="/60A48B70/60C1C92A" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C1C92A" Ref="R?"  Part="1" 
F 0 "R?" V 6057 5350 50  0000 C CNN
F 1 "1k" V 5966 5350 50  0000 C CNN
F 2 "" V 5780 5350 50  0001 C CNN
F 3 "~" H 5850 5350 50  0001 C CNN
	1    5850 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 5350 5600 5350
Wire Wire Line
	3900 5450 3500 5450
Text GLabel 6350 5350 2    50   Input ~ 0
mod_out_d
Text GLabel 4950 5250 0    50   Input ~ 0
ref_dac8
Text GLabel 3500 5450 0    50   Input ~ 0
v_out_dac8_d
Text Notes 6300 5250 0    50   ~ 0
-5.2V to 5.2V
$Comp
L Device:R R?
U 1 1 60C7C8AC
P 8300 1100
AR Path="/60A48B70/60C7C8AC" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C8AC" Ref="R?"  Part="1" 
F 0 "R?" V 8093 1100 50  0000 C CNN
F 1 "36k" V 8184 1100 50  0000 C CNN
F 2 "" V 8230 1100 50  0001 C CNN
F 3 "~" H 8300 1100 50  0001 C CNN
	1    8300 1100
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 1 1 60C7C8B2
P 9500 1000
AR Path="/60A48B70/60C7C8B2" Ref="U?"  Part="1" 
AR Path="/60A5BF82/60C7C8B2" Ref="U?"  Part="1" 
F 0 "U?" H 9500 1367 50  0000 C CNN
F 1 "TL074" H 9500 1276 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 9450 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 9550 1200 50  0001 C CNN
	1    9500 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60C7C8B8
P 10100 1000
AR Path="/60A48B70/60C7C8B8" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C8B8" Ref="R?"  Part="1" 
F 0 "R?" V 10307 1000 50  0000 C CNN
F 1 "1k" V 10216 1000 50  0000 C CNN
F 2 "" V 10030 1000 50  0001 C CNN
F 3 "~" H 10100 1000 50  0001 C CNN
	1    10100 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 1000 9850 1000
Wire Wire Line
	8150 1100 7750 1100
Text GLabel 10600 1000 2    50   Input ~ 0
mod_out_e
Text GLabel 9200 900  0    50   Input ~ 0
ref_dac8
Text GLabel 7750 1100 0    50   Input ~ 0
v_out_dac8_e
$Comp
L Device:R R?
U 1 1 60C7C8D3
P 8300 2500
AR Path="/60A48B70/60C7C8D3" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C8D3" Ref="R?"  Part="1" 
F 0 "R?" V 8093 2500 50  0000 C CNN
F 1 "36k" V 8184 2500 50  0000 C CNN
F 2 "" V 8230 2500 50  0001 C CNN
F 3 "~" H 8300 2500 50  0001 C CNN
	1    8300 2500
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 2 1 60C7C8D9
P 9500 2400
AR Path="/60A48B70/60C7C8D9" Ref="U?"  Part="2" 
AR Path="/60A5BF82/60C7C8D9" Ref="U?"  Part="2" 
F 0 "U?" H 9500 2767 50  0000 C CNN
F 1 "TL074" H 9500 2676 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 9450 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 9550 2600 50  0001 C CNN
	2    9500 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60C7C8DF
P 10100 2400
AR Path="/60A48B70/60C7C8DF" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C8DF" Ref="R?"  Part="1" 
F 0 "R?" V 10307 2400 50  0000 C CNN
F 1 "1k" V 10216 2400 50  0000 C CNN
F 2 "" V 10030 2400 50  0001 C CNN
F 3 "~" H 10100 2400 50  0001 C CNN
	1    10100 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 2400 9850 2400
Wire Wire Line
	8150 2500 7750 2500
Text GLabel 10600 2400 2    50   Input ~ 0
mod_out_f
Text GLabel 9200 2300 0    50   Input ~ 0
ref_dac8
Text GLabel 7750 2500 0    50   Input ~ 0
v_out_dac8_f
$Comp
L Device:R R?
U 1 1 60C7C8FA
P 8300 3900
AR Path="/60A48B70/60C7C8FA" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C8FA" Ref="R?"  Part="1" 
F 0 "R?" V 8093 3900 50  0000 C CNN
F 1 "36k" V 8184 3900 50  0000 C CNN
F 2 "" V 8230 3900 50  0001 C CNN
F 3 "~" H 8300 3900 50  0001 C CNN
	1    8300 3900
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 3 1 60C7C900
P 9500 3800
AR Path="/60A48B70/60C7C900" Ref="U?"  Part="3" 
AR Path="/60A5BF82/60C7C900" Ref="U?"  Part="3" 
F 0 "U?" H 9500 4167 50  0000 C CNN
F 1 "TL074" H 9500 4076 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 9450 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 9550 4000 50  0001 C CNN
	3    9500 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60C7C906
P 10100 3800
AR Path="/60A48B70/60C7C906" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C906" Ref="R?"  Part="1" 
F 0 "R?" V 10307 3800 50  0000 C CNN
F 1 "1k" V 10216 3800 50  0000 C CNN
F 2 "" V 10030 3800 50  0001 C CNN
F 3 "~" H 10100 3800 50  0001 C CNN
	1    10100 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 3800 9850 3800
Wire Wire Line
	8150 3900 7750 3900
Text GLabel 10600 3800 2    50   Input ~ 0
mod_out_g
Text GLabel 9200 3700 0    50   Input ~ 0
ref_dac8
Text GLabel 7750 3900 0    50   Input ~ 0
v_out_dac8_g
Text Notes 10550 900  0    50   ~ 0
-5.2V to 5.2V
Text Notes 10550 2300 0    50   ~ 0
-5.2V to 5.2V
Text Notes 10550 3700 0    50   ~ 0
-5.2V to 5.2V
$Comp
L Device:R R?
U 1 1 60C7C924
P 8300 5350
AR Path="/60A48B70/60C7C924" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C924" Ref="R?"  Part="1" 
F 0 "R?" V 8093 5350 50  0000 C CNN
F 1 "36k" V 8184 5350 50  0000 C CNN
F 2 "" V 8230 5350 50  0001 C CNN
F 3 "~" H 8300 5350 50  0001 C CNN
	1    8300 5350
	0    1    1    0   
$EndComp
$Comp
L Amplifier_Operational:TL074 U?
U 4 1 60C7C92A
P 9500 5250
AR Path="/60A48B70/60C7C92A" Ref="U?"  Part="3" 
AR Path="/60A5BF82/60C7C92A" Ref="U?"  Part="4" 
F 0 "U?" H 9500 5617 50  0000 C CNN
F 1 "TL074" H 9500 5526 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 9450 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 9550 5450 50  0001 C CNN
	4    9500 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60C7C930
P 10100 5250
AR Path="/60A48B70/60C7C930" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60C7C930" Ref="R?"  Part="1" 
F 0 "R?" V 10307 5250 50  0000 C CNN
F 1 "1k" V 10216 5250 50  0000 C CNN
F 2 "" V 10030 5250 50  0001 C CNN
F 3 "~" H 10100 5250 50  0001 C CNN
	1    10100 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 5250 9850 5250
Wire Wire Line
	8150 5350 7750 5350
Text GLabel 10600 5250 2    50   Input ~ 0
mod_out_h
Text GLabel 9200 5150 0    50   Input ~ 0
ref_dac8
Text GLabel 7750 5350 0    50   Input ~ 0
v_out_dac8_h
Text Notes 10550 5150 0    50   ~ 0
-5.2V to 5.2V
$Comp
L Amplifier_Operational:TL074 U?
U 5 1 60C8A445
P 2550 4850
AR Path="/60A48B70/60C8A445" Ref="U?"  Part="5" 
AR Path="/60A5BF82/60C8A445" Ref="U?"  Part="5" 
F 0 "U?" H 2508 4896 50  0000 L CNN
F 1 "TL074" H 2508 4805 50  0000 L CNN
F 2 "" H 2500 4950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2600 5050 50  0001 C CNN
	5    2550 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 60C8A44B
P 2450 4550
AR Path="/60A48B70/60C8A44B" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60C8A44B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 4400 50  0001 C CNN
F 1 "+12V" H 2465 4723 50  0000 C CNN
F 2 "" H 2450 4550 50  0001 C CNN
F 3 "" H 2450 4550 50  0001 C CNN
	1    2450 4550
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR?
U 1 1 60C8A451
P 2450 5150
AR Path="/60A48B70/60C8A451" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60C8A451" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 5250 50  0001 C CNN
F 1 "-12V" H 2465 5323 50  0000 C CNN
F 2 "" H 2450 5150 50  0001 C CNN
F 3 "" H 2450 5150 50  0001 C CNN
	1    2450 5150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 60CA5983
P 1850 2800
AR Path="/60A48B70/60CA5983" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60CA5983" Ref="C?"  Part="1" 
F 0 "C?" H 1735 2754 50  0000 R CNN
F 1 "100n" H 1735 2845 50  0000 R CNN
F 2 "" H 1888 2650 50  0001 C CNN
F 3 "~" H 1850 2800 50  0001 C CNN
	1    1850 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 2650 1850 2550
$Comp
L power:GND #PWR?
U 1 1 60CA598A
P 1850 3050
AR Path="/60A48B70/60CA598A" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60CA598A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1850 2800 50  0001 C CNN
F 1 "GND" H 1855 2877 50  0000 C CNN
F 2 "" H 1850 3050 50  0001 C CNN
F 3 "" H 1850 3050 50  0001 C CNN
	1    1850 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 3050 1850 2950
$Comp
L power:+12V #PWR?
U 1 1 60CA5991
P 1850 2550
AR Path="/60A48B70/60CA5991" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60CA5991" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1850 2400 50  0001 C CNN
F 1 "+12V" H 1865 2723 50  0000 C CNN
F 2 "" H 1850 2550 50  0001 C CNN
F 3 "" H 1850 2550 50  0001 C CNN
	1    1850 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60CA5997
P 2350 2800
AR Path="/60A48B70/60CA5997" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60CA5997" Ref="C?"  Part="1" 
F 0 "C?" H 2235 2754 50  0000 R CNN
F 1 "100n" H 2235 2845 50  0000 R CNN
F 2 "" H 2388 2650 50  0001 C CNN
F 3 "~" H 2350 2800 50  0001 C CNN
	1    2350 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 2650 2350 2550
$Comp
L power:GND #PWR?
U 1 1 60CA599E
P 2350 3050
AR Path="/60A48B70/60CA599E" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60CA599E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 2800 50  0001 C CNN
F 1 "GND" H 2355 2877 50  0000 C CNN
F 2 "" H 2350 3050 50  0001 C CNN
F 3 "" H 2350 3050 50  0001 C CNN
	1    2350 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3050 2350 2950
$Comp
L power:-12V #PWR?
U 1 1 60CA59A5
P 2350 2550
AR Path="/60A48B70/60CA59A5" Ref="#PWR?"  Part="1" 
AR Path="/60A5BF82/60CA59A5" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 2650 50  0001 C CNN
F 1 "-12V" H 2365 2723 50  0000 C CNN
F 2 "" H 2350 2550 50  0001 C CNN
F 3 "" H 2350 2550 50  0001 C CNN
	1    2350 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 60AACA58
P 4900 1600
AR Path="/60A48B70/60AACA58" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60AACA58" Ref="C?"  Part="1" 
F 0 "C?" H 4785 1554 50  0000 R CNN
F 1 "10p" H 4785 1645 50  0000 R CNN
F 2 "" H 4938 1450 50  0001 C CNN
F 3 "~" H 4900 1600 50  0001 C CNN
	1    4900 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 1100 6100 1100
Wire Wire Line
	4200 1200 4600 1200
Wire Wire Line
	4600 1200 4600 1600
Connection ~ 4600 1200
Wire Wire Line
	4600 1200 4950 1200
Wire Wire Line
	5050 1600 5600 1600
Wire Wire Line
	5600 1600 5600 1100
Connection ~ 5600 1100
Wire Wire Line
	5600 1100 5550 1100
Wire Wire Line
	4600 1600 4750 1600
Connection ~ 4600 1600
Wire Wire Line
	4600 1600 4600 1900
Wire Wire Line
	6100 1100 6100 1900
Connection ~ 6100 1100
Wire Wire Line
	6100 1100 6350 1100
Wire Wire Line
	6000 2500 6100 2500
Wire Wire Line
	4200 2600 4600 2600
Wire Wire Line
	6100 3300 5350 3300
$Comp
L Device:R R?
U 1 1 60AC441A
P 5200 3300
AR Path="/60A48B70/60AC441A" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60AC441A" Ref="R?"  Part="1" 
F 0 "R?" V 4993 3300 50  0000 C CNN
F 1 "150k" V 5084 3300 50  0000 C CNN
F 2 "" V 5130 3300 50  0001 C CNN
F 3 "~" H 5200 3300 50  0001 C CNN
	1    5200 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 3300 4600 3300
$Comp
L Device:C C?
U 1 1 60AC4421
P 4900 3000
AR Path="/60A48B70/60AC4421" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60AC4421" Ref="C?"  Part="1" 
F 0 "C?" H 4785 2954 50  0000 R CNN
F 1 "10p" H 4785 3045 50  0000 R CNN
F 2 "" H 4938 2850 50  0001 C CNN
F 3 "~" H 4900 3000 50  0001 C CNN
	1    4900 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 2600 4600 3000
Wire Wire Line
	5050 3000 5600 3000
Wire Wire Line
	5600 3000 5600 2500
Wire Wire Line
	4600 3000 4750 3000
Connection ~ 4600 3000
Wire Wire Line
	4600 3000 4600 3300
Wire Wire Line
	6100 2500 6100 3300
Wire Wire Line
	6000 3900 6100 3900
Wire Wire Line
	4200 4000 4600 4000
Wire Wire Line
	6100 4700 5350 4700
$Comp
L Device:R R?
U 1 1 60ACE0F0
P 5200 4700
AR Path="/60A48B70/60ACE0F0" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60ACE0F0" Ref="R?"  Part="1" 
F 0 "R?" V 4993 4700 50  0000 C CNN
F 1 "150k" V 5084 4700 50  0000 C CNN
F 2 "" V 5130 4700 50  0001 C CNN
F 3 "~" H 5200 4700 50  0001 C CNN
	1    5200 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 4700 4600 4700
$Comp
L Device:C C?
U 1 1 60ACE0F7
P 4900 4400
AR Path="/60A48B70/60ACE0F7" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60ACE0F7" Ref="C?"  Part="1" 
F 0 "C?" H 4785 4354 50  0000 R CNN
F 1 "10p" H 4785 4445 50  0000 R CNN
F 2 "" H 4938 4250 50  0001 C CNN
F 3 "~" H 4900 4400 50  0001 C CNN
	1    4900 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 4000 4600 4400
Wire Wire Line
	5050 4400 5600 4400
Wire Wire Line
	5600 4400 5600 3900
Wire Wire Line
	4600 4400 4750 4400
Connection ~ 4600 4400
Wire Wire Line
	4600 4400 4600 4700
Wire Wire Line
	6100 3900 6100 4700
Connection ~ 5600 2500
Wire Wire Line
	5600 2500 5550 2500
Connection ~ 6100 2500
Wire Wire Line
	6100 2500 6350 2500
Connection ~ 4600 2600
Wire Wire Line
	4600 2600 4950 2600
Connection ~ 4600 4000
Wire Wire Line
	4600 4000 4950 4000
Connection ~ 5600 3900
Wire Wire Line
	5600 3900 5550 3900
Connection ~ 6100 3900
Wire Wire Line
	6100 3900 6350 3900
Wire Wire Line
	6000 5350 6100 5350
Wire Wire Line
	4200 5450 4600 5450
Wire Wire Line
	6100 6150 5350 6150
$Comp
L Device:R R?
U 1 1 60AD77D5
P 5200 6150
AR Path="/60A48B70/60AD77D5" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60AD77D5" Ref="R?"  Part="1" 
F 0 "R?" V 4993 6150 50  0000 C CNN
F 1 "150k" V 5084 6150 50  0000 C CNN
F 2 "" V 5130 6150 50  0001 C CNN
F 3 "~" H 5200 6150 50  0001 C CNN
	1    5200 6150
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 6150 4600 6150
$Comp
L Device:C C?
U 1 1 60AD77DC
P 4900 5850
AR Path="/60A48B70/60AD77DC" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60AD77DC" Ref="C?"  Part="1" 
F 0 "C?" H 4785 5804 50  0000 R CNN
F 1 "10p" H 4785 5895 50  0000 R CNN
F 2 "" H 4938 5700 50  0001 C CNN
F 3 "~" H 4900 5850 50  0001 C CNN
	1    4900 5850
	0    1    1    0   
$EndComp
Wire Wire Line
	4600 5450 4600 5850
Wire Wire Line
	5050 5850 5600 5850
Wire Wire Line
	5600 5850 5600 5350
Wire Wire Line
	4600 5850 4750 5850
Connection ~ 4600 5850
Wire Wire Line
	4600 5850 4600 6150
Wire Wire Line
	6100 5350 6100 6150
Wire Wire Line
	10250 5250 10350 5250
Wire Wire Line
	8450 5350 8850 5350
Wire Wire Line
	10250 3800 10350 3800
Wire Wire Line
	8450 3900 8850 3900
Wire Wire Line
	10250 2400 10350 2400
Wire Wire Line
	8450 2500 8850 2500
Wire Wire Line
	10250 1000 10350 1000
Wire Wire Line
	10350 1800 9600 1800
$Comp
L Device:R R?
U 1 1 60AEAB4D
P 9450 1800
AR Path="/60A48B70/60AEAB4D" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60AEAB4D" Ref="R?"  Part="1" 
F 0 "R?" V 9243 1800 50  0000 C CNN
F 1 "150k" V 9334 1800 50  0000 C CNN
F 2 "" V 9380 1800 50  0001 C CNN
F 3 "~" H 9450 1800 50  0001 C CNN
	1    9450 1800
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 1800 8850 1800
$Comp
L Device:C C?
U 1 1 60AEAB54
P 9150 1500
AR Path="/60A48B70/60AEAB54" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60AEAB54" Ref="C?"  Part="1" 
F 0 "C?" H 9035 1454 50  0000 R CNN
F 1 "10p" H 9035 1545 50  0000 R CNN
F 2 "" H 9188 1350 50  0001 C CNN
F 3 "~" H 9150 1500 50  0001 C CNN
	1    9150 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 1100 8850 1500
Wire Wire Line
	9300 1500 9850 1500
Wire Wire Line
	9850 1500 9850 1000
Wire Wire Line
	8850 1500 9000 1500
Connection ~ 8850 1500
Wire Wire Line
	8850 1500 8850 1800
Wire Wire Line
	10350 1000 10350 1800
Wire Wire Line
	10350 3200 9600 3200
$Comp
L Device:R R?
U 1 1 60AEE812
P 9450 3200
AR Path="/60A48B70/60AEE812" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60AEE812" Ref="R?"  Part="1" 
F 0 "R?" V 9243 3200 50  0000 C CNN
F 1 "150k" V 9334 3200 50  0000 C CNN
F 2 "" V 9380 3200 50  0001 C CNN
F 3 "~" H 9450 3200 50  0001 C CNN
	1    9450 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 3200 8850 3200
$Comp
L Device:C C?
U 1 1 60AEE819
P 9150 2900
AR Path="/60A48B70/60AEE819" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60AEE819" Ref="C?"  Part="1" 
F 0 "C?" H 9035 2854 50  0000 R CNN
F 1 "10p" H 9035 2945 50  0000 R CNN
F 2 "" H 9188 2750 50  0001 C CNN
F 3 "~" H 9150 2900 50  0001 C CNN
	1    9150 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 2500 8850 2900
Wire Wire Line
	9300 2900 9850 2900
Wire Wire Line
	9850 2900 9850 2400
Wire Wire Line
	8850 2900 9000 2900
Connection ~ 8850 2900
Wire Wire Line
	8850 2900 8850 3200
Wire Wire Line
	10350 2400 10350 3200
Wire Wire Line
	10350 4600 9600 4600
$Comp
L Device:R R?
U 1 1 60AF2983
P 9450 4600
AR Path="/60A48B70/60AF2983" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60AF2983" Ref="R?"  Part="1" 
F 0 "R?" V 9243 4600 50  0000 C CNN
F 1 "150k" V 9334 4600 50  0000 C CNN
F 2 "" V 9380 4600 50  0001 C CNN
F 3 "~" H 9450 4600 50  0001 C CNN
	1    9450 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 4600 8850 4600
$Comp
L Device:C C?
U 1 1 60AF298A
P 9150 4300
AR Path="/60A48B70/60AF298A" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60AF298A" Ref="C?"  Part="1" 
F 0 "C?" H 9035 4254 50  0000 R CNN
F 1 "10p" H 9035 4345 50  0000 R CNN
F 2 "" H 9188 4150 50  0001 C CNN
F 3 "~" H 9150 4300 50  0001 C CNN
	1    9150 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 3900 8850 4300
Wire Wire Line
	9300 4300 9850 4300
Wire Wire Line
	9850 4300 9850 3800
Wire Wire Line
	8850 4300 9000 4300
Connection ~ 8850 4300
Wire Wire Line
	8850 4300 8850 4600
Wire Wire Line
	10350 3800 10350 4600
Wire Wire Line
	10350 6050 9600 6050
$Comp
L Device:R R?
U 1 1 60AF6F9C
P 9450 6050
AR Path="/60A48B70/60AF6F9C" Ref="R?"  Part="1" 
AR Path="/60A5BF82/60AF6F9C" Ref="R?"  Part="1" 
F 0 "R?" V 9243 6050 50  0000 C CNN
F 1 "150k" V 9334 6050 50  0000 C CNN
F 2 "" V 9380 6050 50  0001 C CNN
F 3 "~" H 9450 6050 50  0001 C CNN
	1    9450 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 6050 8850 6050
$Comp
L Device:C C?
U 1 1 60AF6FA3
P 9150 5750
AR Path="/60A48B70/60AF6FA3" Ref="C?"  Part="1" 
AR Path="/60A5BF82/60AF6FA3" Ref="C?"  Part="1" 
F 0 "C?" H 9035 5704 50  0000 R CNN
F 1 "10p" H 9035 5795 50  0000 R CNN
F 2 "" H 9188 5600 50  0001 C CNN
F 3 "~" H 9150 5750 50  0001 C CNN
	1    9150 5750
	0    1    1    0   
$EndComp
Wire Wire Line
	8850 5350 8850 5750
Wire Wire Line
	9300 5750 9850 5750
Wire Wire Line
	9850 5750 9850 5250
Wire Wire Line
	8850 5750 9000 5750
Connection ~ 8850 5750
Wire Wire Line
	8850 5750 8850 6050
Wire Wire Line
	10350 5250 10350 6050
Connection ~ 4600 5450
Wire Wire Line
	4600 5450 4950 5450
Connection ~ 5600 5350
Wire Wire Line
	5600 5350 5550 5350
Connection ~ 6100 5350
Wire Wire Line
	6100 5350 6350 5350
Connection ~ 8850 5350
Wire Wire Line
	8850 5350 9200 5350
Connection ~ 9850 5250
Wire Wire Line
	9850 5250 9800 5250
Connection ~ 10350 5250
Wire Wire Line
	10350 5250 10600 5250
Connection ~ 8850 3900
Wire Wire Line
	8850 3900 9200 3900
Connection ~ 9850 3800
Wire Wire Line
	9850 3800 9800 3800
Connection ~ 10350 3800
Wire Wire Line
	10350 3800 10600 3800
Connection ~ 8850 2500
Wire Wire Line
	8850 2500 9200 2500
Connection ~ 10350 2400
Wire Wire Line
	10350 2400 10600 2400
Wire Wire Line
	8450 1100 8850 1100
Connection ~ 8850 1100
Wire Wire Line
	8850 1100 9200 1100
Connection ~ 10350 1000
Wire Wire Line
	10350 1000 10600 1000
Connection ~ 9850 1000
Wire Wire Line
	9850 1000 9800 1000
Connection ~ 9850 2400
Wire Wire Line
	9850 2400 9800 2400
Text GLabel 1800 6550 0    50   Input ~ 0
v_out_dac8_a
Text GLabel 1800 6650 0    50   Input ~ 0
v_out_dac8_c
Text GLabel 1800 6750 0    50   Input ~ 0
v_out_dac8_e
Text GLabel 1800 6850 0    50   Input ~ 0
v_out_dac8_g
Text GLabel 3500 6550 2    50   Input ~ 0
v_out_dac8_b
Text GLabel 3500 6650 2    50   Input ~ 0
v_out_dac8_d
Text GLabel 3500 6750 2    50   Input ~ 0
v_out_dac8_f
Text GLabel 3500 6850 2    50   Input ~ 0
v_out_dac8_h
$EndSCHEMATC
