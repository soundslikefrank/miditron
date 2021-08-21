EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Mechanical:MountingHole_Pad H1
U 1 1 6111B1C8
P 2450 1350
F 0 "H1" H 2550 1399 50  0000 L CNN
F 1 "MountingHole_Pad" H 2550 1308 50  0000 L CNN
F 2 "Mounting_Wuerth:MountingHole_3.2mm_M3_Pad_small" H 2450 1350 50  0001 C CNN
F 3 "~" H 2450 1350 50  0001 C CNN
	1    2450 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 6111B745
P 3400 1350
F 0 "H2" H 3500 1399 50  0000 L CNN
F 1 "MountingHole_Pad" H 3500 1308 50  0000 L CNN
F 2 "Mounting_Wuerth:MountingHole_3.2mm_M3_Pad_small" H 3400 1350 50  0001 C CNN
F 3 "~" H 3400 1350 50  0001 C CNN
	1    3400 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 6111BB9E
P 4350 1350
F 0 "H3" H 4450 1399 50  0000 L CNN
F 1 "MountingHole_Pad" H 4450 1308 50  0000 L CNN
F 2 "Mounting_Wuerth:MountingHole_3.2mm_M3_Pad_small" H 4350 1350 50  0001 C CNN
F 3 "~" H 4350 1350 50  0001 C CNN
	1    4350 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 6111BF4E
P 5300 1350
F 0 "H4" H 5400 1399 50  0000 L CNN
F 1 "MountingHole_Pad" H 5400 1308 50  0000 L CNN
F 2 "Mounting_Wuerth:MountingHole_3.2mm_M3_Pad_small" H 5300 1350 50  0001 C CNN
F 3 "~" H 5300 1350 50  0001 C CNN
	1    5300 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 6111C873
P 5300 1750
F 0 "#PWR01" H 5300 1500 50  0001 C CNN
F 1 "GND" H 5305 1577 50  0000 C CNN
F 2 "" H 5300 1750 50  0001 C CNN
F 3 "" H 5300 1750 50  0001 C CNN
	1    5300 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1750 5300 1450
Wire Wire Line
	2450 1450 3400 1450
Wire Wire Line
	3400 1450 4350 1450
Connection ~ 3400 1450
Wire Wire Line
	4350 1450 5300 1450
Connection ~ 4350 1450
Connection ~ 5300 1450
$EndSCHEMATC
