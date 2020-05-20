EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Coffee Grams"
Date "2020-05-19"
Rev "0.1"
Comp "Enoch Chau"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1900 4100 1900 3900
Wire Wire Line
	1900 3300 1900 3100
Wire Wire Line
	1900 2650 1900 2450
$Comp
L power:GND #PWR01
U 1 1 5ECAF362
P 900 4550
F 0 "#PWR01" H 900 4300 50  0001 C CNN
F 1 "GND" H 905 4377 50  0000 C CNN
F 2 "" H 900 4550 50  0001 C CNN
F 3 "" H 900 4550 50  0001 C CNN
	1    900  4550
	1    0    0    -1  
$EndComp
Connection ~ 900  3900
Wire Wire Line
	900  3900 900  4550
Wire Wire Line
	900  2450 900  3100
Connection ~ 1350 2450
Wire Wire Line
	1350 2450 900  2450
Connection ~ 1350 3100
Wire Wire Line
	900  3100 900  3900
Connection ~ 900  3100
Wire Wire Line
	900  3100 1350 3100
Connection ~ 1350 3900
Wire Wire Line
	900  3900 1350 3900
Wire Wire Line
	1350 4100 1500 4100
Wire Wire Line
	1350 3900 1350 4100
Wire Wire Line
	1500 3900 1350 3900
Wire Wire Line
	1350 3300 1500 3300
Wire Wire Line
	1350 3100 1350 3300
Wire Wire Line
	1500 3100 1350 3100
Wire Wire Line
	1350 2650 1500 2650
Wire Wire Line
	1350 2450 1350 2650
Wire Wire Line
	1500 2450 1350 2450
$Comp
L Switch:SW_Push_Dual SW4
U 1 1 5EC3C307
P 1700 3100
F 0 "SW4" H 1700 3385 50  0000 C CNN
F 1 "BX_COFFEE_G" H 1700 3294 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 1700 3300 50  0001 C CNN
F 3 "~" H 1700 3300 50  0001 C CNN
	1    1700 3100
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW5
U 1 1 5EC3B775
P 1700 3900
F 0 "SW5" H 1700 4185 50  0000 C CNN
F 1 "BX_H2O_G" H 1700 4094 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 1700 4100 50  0001 C CNN
F 3 "~" H 1700 4100 50  0001 C CNN
	1    1700 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW3
U 1 1 5EC3A366
P 1700 2450
F 0 "SW3" H 1700 2735 50  0000 C CNN
F 1 "BX_TIMER" H 1700 2644 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 1700 2650 50  0001 C CNN
F 3 "~" H 1700 2650 50  0001 C CNN
	1    1700 2450
	1    0    0    -1  
$EndComp
Connection ~ 900  2450
$Comp
L Switch:SW_Push_Dual SW2
U 1 1 5EC36E5D
P 1700 1700
F 0 "SW2" H 1700 1985 50  0000 C CNN
F 1 "BX_ON_OFF" H 1700 1894 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 1700 1900 50  0001 C CNN
F 3 "~" H 1700 1900 50  0001 C CNN
	1    1700 1700
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual SW1
U 1 1 5EC38B54
P 1700 1050
F 0 "SW1" H 1700 1335 50  0000 C CNN
F 1 "BX_TARE" H 1700 1244 50  0000 C CNN
F 2 "Button_Switch_THT:SW_TH_Tactile_Omron_B3F-10xx" H 1700 1250 50  0001 C CNN
F 3 "~" H 1700 1250 50  0001 C CNN
	1    1700 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1050 1350 1250
Wire Wire Line
	1350 1250 1500 1250
Wire Wire Line
	900  1700 900  1050
Wire Wire Line
	900  1050 1350 1050
Connection ~ 1350 1050
Wire Wire Line
	1350 1050 1500 1050
Wire Wire Line
	1900 1250 1900 1050
Wire Wire Line
	1900 1050 2150 1050
Connection ~ 1900 1050
Text Label 2150 1050 0    50   ~ 0
BX_TARE
Text Label 2150 1700 0    50   ~ 0
BX_ON_OFF
Text Label 2150 2450 0    50   ~ 0
BX_TIMER
Text Label 2150 3100 0    50   ~ 0
BX_COFFEE_G
Text Label 2150 3900 0    50   ~ 0
BX_H2O_G
Wire Wire Line
	1500 1700 1350 1700
Wire Wire Line
	1350 1700 1350 1900
Wire Wire Line
	1350 1900 1500 1900
Wire Wire Line
	1350 1700 900  1700
Connection ~ 1350 1700
Wire Wire Line
	900  1700 900  2450
Wire Wire Line
	1900 1900 1900 1700
Connection ~ 900  1700
Text Notes 4100 3050 0    50   ~ 0
Shield
Text Notes 4200 2950 0    50   ~ 0
A+
Text Notes 4200 2850 0    50   ~ 0
A-
Text Notes 4200 2750 0    50   ~ 0
E-
Text Notes 4200 2650 0    50   ~ 0
E+
$Comp
L coffee_grams:HX711 U2
U 1 1 5EC3FCF8
P 8000 3050
F 0 "U2" H 8150 3965 50  0000 C CNN
F 1 "HX711" H 8150 3874 50  0000 C CNN
F 2 "Package_SO:SOP-16_4.4x10.4mm_P1.27mm" H 8000 3050 50  0001 C CNN
F 3 "https://cdn.sparkfun.com/datasheets/Sensors/ForceFlex/hx711_english.pdf" H 8000 3050 50  0001 C CNN
	1    8000 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 1350 7100 2400
Wire Wire Line
	7100 2400 7650 2400
Wire Wire Line
	8650 2400 8800 2400
Wire Wire Line
	8800 2400 8800 1350
Wire Wire Line
	8800 1350 8550 1350
$Comp
L Device:R R4
U 1 1 5EC43017
P 6300 2800
F 0 "R4" H 6370 2846 50  0000 L CNN
F 1 "20k" H 6370 2755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6230 2800 50  0001 C CNN
F 3 "~" H 6300 2800 50  0001 C CNN
	1    6300 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5EC44568
P 6300 3250
F 0 "R5" H 6230 3204 50  0000 R CNN
F 1 "8.2k" H 6230 3295 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6230 3250 50  0001 C CNN
F 3 "~" H 6300 3250 50  0001 C CNN
	1    6300 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 5EC44F1C
P 6950 4000
F 0 "R6" V 6743 4000 50  0000 C CNN
F 1 "100" V 6834 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6880 4000 50  0001 C CNN
F 3 "~" H 6950 4000 50  0001 C CNN
	1    6950 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5EC456F2
P 6950 4500
F 0 "R7" V 6743 4500 50  0000 C CNN
F 1 "100" V 6834 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6880 4500 50  0001 C CNN
F 3 "~" H 6950 4500 50  0001 C CNN
	1    6950 4500
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 5EC45954
P 6700 3650
F 0 "C7" H 6815 3696 50  0000 L CNN
F 1 "0.1u" H 6815 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6738 3500 50  0001 C CNN
F 3 "~" H 6700 3650 50  0001 C CNN
	1    6700 3650
	0    1    1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 5EC46A13
P 7400 4200
F 0 "C8" H 7515 4246 50  0000 L CNN
F 1 "0.1u" H 7515 4155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7438 4050 50  0001 C CNN
F 3 "~" H 7400 4200 50  0001 C CNN
	1    7400 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	7650 3100 7650 4500
Wire Wire Line
	7650 4500 7400 4500
Wire Wire Line
	7650 3000 7400 3000
Wire Wire Line
	7400 3000 7400 4000
Wire Wire Line
	7400 4000 7100 4000
Wire Wire Line
	7400 4050 7400 4000
Connection ~ 7400 4000
Wire Wire Line
	7400 4350 7400 4500
Connection ~ 7400 4500
Wire Wire Line
	7400 4500 7100 4500
Wire Wire Line
	6550 3650 6500 3650
Connection ~ 6300 3650
Wire Wire Line
	6300 3650 6300 3800
Wire Wire Line
	6850 3650 7250 3650
Wire Wire Line
	7250 2900 7650 2900
Wire Wire Line
	7650 2800 7100 2800
Wire Wire Line
	7100 3450 6500 3450
Wire Wire Line
	6500 3450 6500 3650
Connection ~ 6500 3650
Wire Wire Line
	6500 3650 6300 3650
$Comp
L power:GND #PWR012
U 1 1 5EC4B401
P 6300 3800
F 0 "#PWR012" H 6300 3550 50  0001 C CNN
F 1 "GND" H 6305 3627 50  0000 C CNN
F 2 "" H 6300 3800 50  0001 C CNN
F 3 "" H 6300 3800 50  0001 C CNN
	1    6300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2900 7250 3650
Wire Wire Line
	7100 2800 7100 3450
Wire Wire Line
	6300 3400 6300 3650
Wire Wire Line
	6300 3100 6300 3000
Wire Wire Line
	7650 2700 6900 2700
Wire Wire Line
	6900 2700 6900 3000
Wire Wire Line
	6900 3000 6300 3000
Connection ~ 6300 3000
Wire Wire Line
	6300 3000 6300 2950
Wire Wire Line
	7650 2600 6600 2600
Wire Wire Line
	6300 2600 6300 2650
$Comp
L Device:Q_PNP_BCE Q3
U 1 1 5EC59A5A
P 6700 2200
F 0 "Q3" H 6891 2154 50  0000 L CNN
F 1 "MMBT4403" H 6891 2245 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6900 2300 50  0001 C CNN
F 3 "~" H 6700 2200 50  0001 C CNN
	1    6700 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 2400 6600 2600
Connection ~ 6600 2600
Wire Wire Line
	6600 2600 6300 2600
Wire Wire Line
	6600 2000 6600 1650
$Comp
L Device:C C6
U 1 1 5EC5E4DA
P 5650 2750
F 0 "C6" H 5765 2796 50  0000 L CNN
F 1 "10u" H 5765 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5688 2600 50  0001 C CNN
F 3 "~" H 5650 2750 50  0001 C CNN
	1    5650 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5EC5EBDE
P 5250 2750
F 0 "C5" H 5365 2796 50  0000 L CNN
F 1 "0.1u" H 5365 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5288 2600 50  0001 C CNN
F 3 "~" H 5250 2750 50  0001 C CNN
	1    5250 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 5EC5F563
P 4400 2800
F 0 "J2" H 4508 3181 50  0000 C CNN
F 1 "Conn_01x05_Male" H 4508 3090 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x05_P2.54mm_Vertical" H 4400 2800 50  0001 C CNN
F 3 "~" H 4400 2800 50  0001 C CNN
	1    4400 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 5EC5FFEB
P 5950 2600
F 0 "L1" V 6140 2600 50  0000 C CNN
F 1 "3.3u" V 6049 2600 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 2600 50  0001 C CNN
F 3 "~" H 5950 2600 50  0001 C CNN
	1    5950 2600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 2600 6300 2600
Connection ~ 6300 2600
Wire Wire Line
	5650 2600 5800 2600
Wire Wire Line
	5250 2600 5650 2600
Connection ~ 5650 2600
$Comp
L power:GND #PWR010
U 1 1 5EC6373D
P 5250 3100
F 0 "#PWR010" H 5250 2850 50  0001 C CNN
F 1 "GND" H 5255 2927 50  0000 C CNN
F 2 "" H 5250 3100 50  0001 C CNN
F 3 "" H 5250 3100 50  0001 C CNN
	1    5250 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5EC63EB0
P 5650 3100
F 0 "#PWR011" H 5650 2850 50  0001 C CNN
F 1 "GND" H 5655 2927 50  0000 C CNN
F 2 "" H 5650 3100 50  0001 C CNN
F 3 "" H 5650 3100 50  0001 C CNN
	1    5650 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2900 5250 3100
Wire Wire Line
	5650 2900 5650 3100
Wire Wire Line
	5250 2600 4600 2600
Connection ~ 5250 2600
Text Label 4900 2600 0    50   ~ 0
AVDD
$Comp
L power:GND #PWR09
U 1 1 5EC68ED5
P 5000 2700
F 0 "#PWR09" H 5000 2450 50  0001 C CNN
F 1 "GND" H 5005 2527 50  0000 C CNN
F 2 "" H 5000 2700 50  0001 C CNN
F 3 "" H 5000 2700 50  0001 C CNN
	1    5000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2700 5000 2700
Wire Wire Line
	4600 2800 4850 2800
Wire Wire Line
	4850 2800 4850 4000
Wire Wire Line
	4850 4000 6800 4000
Wire Wire Line
	4600 2900 4800 2900
Wire Wire Line
	4800 2900 4800 4500
Wire Wire Line
	4800 4500 6800 4500
Wire Wire Line
	4600 3000 4600 3200
$Comp
L power:GND #PWR08
U 1 1 5EC6EA3D
P 4600 3200
F 0 "#PWR08" H 4600 2950 50  0001 C CNN
F 1 "GND" H 4605 3027 50  0000 C CNN
F 2 "" H 4600 3200 50  0001 C CNN
F 3 "" H 4600 3200 50  0001 C CNN
	1    4600 3200
	1    0    0    -1  
$EndComp
Text Label 4650 2800 0    50   ~ 0
A-
Text Label 4650 2900 0    50   ~ 0
A+
Text Notes 4950 2300 0    50   ~ 0
AVDD=VBG(R1+R2)/R2
NoConn ~ 8650 3000
NoConn ~ 8650 3100
$Comp
L power:GND #PWR019
U 1 1 5EC784A2
P 9400 2550
F 0 "#PWR019" H 9400 2300 50  0001 C CNN
F 1 "GND" H 9405 2377 50  0000 C CNN
F 2 "" H 9400 2550 50  0001 C CNN
F 3 "" H 9400 2550 50  0001 C CNN
	1    9400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2500 9000 2500
Wire Wire Line
	9000 2500 9000 1500
$Comp
L Device:R R8
U 1 1 5EC7A9EB
P 9350 1200
F 0 "R8" H 9420 1246 50  0000 L CNN
F 1 "10k" H 9420 1155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9280 1200 50  0001 C CNN
F 3 "~" H 9350 1200 50  0001 C CNN
	1    9350 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 5EC7D2F5
P 9350 1850
F 0 "JP1" V 9304 1977 50  0000 L CNN
F 1 "Jumper" V 9395 1977 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 9350 1850 50  0001 C CNN
F 3 "~" H 9350 1850 50  0001 C CNN
	1    9350 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	8650 2800 10200 2800
Wire Wire Line
	8650 2900 10200 2900
Wire Wire Line
	9150 2600 9150 2550
Wire Wire Line
	9150 2550 9350 2550
Wire Wire Line
	8650 2600 9150 2600
Text Notes 9500 1600 0    50   ~ 0
Default: Closed - Data rate: 10 SPS\nOpen - 80 SPS, more noise per read
Wire Wire Line
	9350 750  9350 1050
Wire Wire Line
	9350 1550 9350 1500
Wire Wire Line
	9000 1500 9350 1500
Connection ~ 9350 1500
Wire Wire Line
	9350 1500 9350 1350
Wire Wire Line
	9350 2150 9350 2550
Connection ~ 9350 2550
Wire Wire Line
	9350 2550 9400 2550
NoConn ~ 8650 2700
Wire Wire Line
	6900 2200 6950 2200
Wire Wire Line
	6950 2200 6950 2500
Wire Wire Line
	6950 2500 7650 2500
Text Label 10200 2800 0    50   ~ 0
HX_DOUT
Text Label 10200 2900 0    50   ~ 0
HX_SCK
Wire Wire Line
	6650 1300 6650 1350
Wire Wire Line
	6650 1350 7100 1350
Wire Wire Line
	8550 1350 8550 950 
Wire Wire Line
	1900 1700 2150 1700
Connection ~ 1900 1700
Wire Wire Line
	1900 3900 2150 3900
Connection ~ 1900 3900
Wire Wire Line
	1900 3100 2150 3100
Connection ~ 1900 3100
Wire Wire Line
	1900 2450 2150 2450
Connection ~ 1900 2450
$Comp
L Device:R R9
U 1 1 5EF081D7
P 9750 6750
F 0 "R9" V 9543 6750 50  0000 C CNN
F 1 "150" V 9634 6750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9680 6750 50  0001 C CNN
F 3 "~" H 9750 6750 50  0001 C CNN
	1    9750 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5EF08F7B
P 9750 7150
F 0 "R10" V 9543 7150 50  0000 C CNN
F 1 "150" V 9634 7150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9680 7150 50  0001 C CNN
F 3 "~" H 9750 7150 50  0001 C CNN
	1    9750 7150
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5EF09166
P 10450 6750
F 0 "R11" V 10243 6750 50  0000 C CNN
F 1 "4.7k" V 10334 6750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10380 6750 50  0001 C CNN
F 3 "~" H 10450 6750 50  0001 C CNN
	1    10450 6750
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5EF094F8
P 10450 7150
F 0 "R12" V 10243 7150 50  0000 C CNN
F 1 "4.7K" V 10334 7150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10380 7150 50  0001 C CNN
F 3 "~" H 10450 7150 50  0001 C CNN
	1    10450 7150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5EF09D38
P 10800 6850
F 0 "#PWR020" H 10800 6600 50  0001 C CNN
F 1 "GND" H 10805 6677 50  0000 C CNN
F 2 "" H 10800 6850 50  0001 C CNN
F 3 "" H 10800 6850 50  0001 C CNN
	1    10800 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 6750 10800 6750
Wire Wire Line
	9900 6750 10100 6750
Wire Wire Line
	9900 7150 10100 7150
Wire Wire Line
	9450 6750 9600 6750
Wire Wire Line
	10100 6750 10100 6300
Connection ~ 10100 6750
Wire Wire Line
	10100 6750 10300 6750
Wire Wire Line
	10800 6750 10800 6850
Wire Wire Line
	10600 7150 10800 7150
Wire Wire Line
	10800 7150 10800 7250
$Comp
L power:GND #PWR021
U 1 1 5EF4CADC
P 10800 7250
F 0 "#PWR021" H 10800 7000 50  0001 C CNN
F 1 "GND" H 10805 7077 50  0000 C CNN
F 2 "" H 10800 7250 50  0001 C CNN
F 3 "" H 10800 7250 50  0001 C CNN
	1    10800 7250
	1    0    0    -1  
$EndComp
Text Label 10100 7350 0    50   ~ 0
RXD0
Wire Wire Line
	10100 7150 10100 7350
Connection ~ 10100 7150
Wire Wire Line
	10100 7150 10300 7150
Text Label 10100 6300 0    50   ~ 0
TXD0
Text Label 7300 6750 0    50   ~ 0
EN
Text Label 9100 6750 0    50   ~ 0
IO0
Connection ~ 3900 6250
Text Label 6500 8600 0    50   ~ 0
EN
Text Label 6250 7000 0    50   ~ 0
IO0
Text Label 4900 7750 0    50   ~ 0
RTS
Text Label 4900 7950 0    50   ~ 0
DTR
Wire Wire Line
	6050 8600 6500 8600
Wire Wire Line
	6050 8400 6050 8600
Wire Wire Line
	6050 7000 6250 7000
Wire Wire Line
	6050 7300 6050 7000
Connection ~ 5150 7750
Wire Wire Line
	6050 7900 6050 8000
Wire Wire Line
	5350 7900 6050 7900
Wire Wire Line
	5350 7750 5350 7900
Wire Wire Line
	5150 7750 5350 7750
Connection ~ 5150 7950
Wire Wire Line
	5450 7950 5150 7950
Wire Wire Line
	5450 7700 5450 7950
Wire Wire Line
	6050 7700 5450 7700
Wire Wire Line
	5600 8200 5750 8200
Wire Wire Line
	5150 8200 5300 8200
Wire Wire Line
	5150 7950 5150 8200
Wire Wire Line
	4600 7950 5150 7950
$Comp
L Device:R R3
U 1 1 5EFB2FE1
P 5450 8200
F 0 "R3" V 5243 8200 50  0000 C CNN
F 1 "12K" V 5334 8200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5380 8200 50  0001 C CNN
F 3 "~" H 5450 8200 50  0001 C CNN
	1    5450 8200
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 7500 5300 7500
Wire Wire Line
	5150 7750 5150 7500
Wire Wire Line
	4600 7750 5150 7750
Wire Wire Line
	5600 7500 5750 7500
$Comp
L Device:R R2
U 1 1 5EF9B435
P 5450 7500
F 0 "R2" V 5243 7500 50  0000 C CNN
F 1 "12K" V 5334 7500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5380 7500 50  0001 C CNN
F 3 "~" H 5450 7500 50  0001 C CNN
	1    5450 7500
	0    1    1    0   
$EndComp
NoConn ~ 4600 7850
$Comp
L Transistor_BJT:BC847 Q1
U 1 1 5EF84E97
P 5950 7500
F 0 "Q1" H 6141 7546 50  0000 L CNN
F 1 "BC847" H 6141 7455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6150 7425 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 5950 7500 50  0001 L CNN
	1    5950 7500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC847 Q2
U 1 1 5EF81F01
P 5950 8200
F 0 "Q2" H 6141 8154 50  0000 L CNN
F 1 "BC847" H 6141 8245 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6150 8125 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/Infineon-BC847SERIES_BC848SERIES_BC849SERIES_BC850SERIES-DS-v01_01-en.pdf?fileId=db3a304314dca389011541d4630a1657" H 5950 8200 50  0001 L CNN
	1    5950 8200
	1    0    0    1   
$EndComp
NoConn ~ 4600 8650
NoConn ~ 4600 8550
Text Label 4750 7650 0    50   ~ 0
TXD0
Wire Wire Line
	4600 7650 4750 7650
Text Label 4750 7550 0    50   ~ 0
RXD0
Wire Wire Line
	4600 7550 4750 7550
$Comp
L Device:R R1
U 1 1 5EEEC5FF
P 1000 8500
F 0 "R1" H 1070 8546 50  0000 L CNN
F 1 "1M" H 1070 8455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 930 8500 50  0001 C CNN
F 3 "~" H 1000 8500 50  0001 C CNN
	1    1000 8500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 8800 1500 8800
Connection ~ 1250 8800
Wire Wire Line
	1500 8800 1500 9000
Connection ~ 1500 8800
Wire Wire Line
	1000 8800 1250 8800
Wire Wire Line
	1000 8650 1000 8800
Wire Wire Line
	1250 8250 1000 8250
Connection ~ 1250 8250
Wire Wire Line
	1250 8250 1250 8500
Wire Wire Line
	1000 8250 1000 8350
Wire Wire Line
	1400 8250 1250 8250
$Comp
L Device:C C1
U 1 1 5EEECC2A
P 1250 8650
F 0 "C1" H 1365 8696 50  0000 L CNN
F 1 "4.7n" H 1365 8605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1288 8500 50  0001 C CNN
F 3 "~" H 1250 8650 50  0001 C CNN
	1    1250 8650
	1    0    0    -1  
$EndComp
NoConn ~ 1800 8050
Wire Wire Line
	2900 6850 2900 6950
$Comp
L power:GND #PWR05
U 1 1 5EEA5F42
P 2900 6950
F 0 "#PWR05" H 2900 6700 50  0001 C CNN
F 1 "GND" H 2905 6777 50  0000 C CNN
F 2 "" H 2900 6950 50  0001 C CNN
F 3 "" H 2900 6950 50  0001 C CNN
	1    2900 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 7250 3000 7250
Connection ~ 3350 7250
Wire Wire Line
	3350 6550 3350 7250
Wire Wire Line
	2900 6550 3350 6550
Wire Wire Line
	3900 6250 3900 7250
Wire Wire Line
	3900 6250 2450 6250
$Comp
L Device:C C4
U 1 1 5EE987B4
P 2900 6700
F 0 "C4" H 3015 6746 50  0000 L CNN
F 1 ".1u" H 3015 6655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2938 6550 50  0001 C CNN
F 3 "~" H 2900 6700 50  0001 C CNN
	1    2900 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 7250 3000 7550
Wire Wire Line
	3700 7250 3350 7250
Wire Wire Line
	1800 7650 1800 7100
$Comp
L Connector:USB_B_Mini J1
U 1 1 5EDB6F28
P 1500 7850
F 0 "J1" H 1557 8317 50  0000 C CNN
F 1 "USB_B_Mini" H 1557 8226 50  0000 C CNN
F 2 "Connector_USB:USB_Mini-B_Wuerth_65100516121_Horizontal" H 1650 7800 50  0001 C CNN
F 3 "~" H 1650 7800 50  0001 C CNN
	1    1500 7850
	1    0    0    -1  
$EndComp
$Comp
L Interface_USB:FT232RL U1
U 1 1 5EDB4C47
P 3800 8250
F 0 "U1" H 3800 9431 50  0000 C CNN
F 1 "FT232RL" H 3800 9340 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 4900 7350 50  0001 C CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232R.pdf" H 3800 8250 50  0001 C CNN
	1    3800 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 7850 3000 7850
Wire Wire Line
	1800 7950 3000 7950
$Comp
L power:GND #PWR02
U 1 1 5EDDBD1F
P 1500 9000
F 0 "#PWR02" H 1500 8750 50  0001 C CNN
F 1 "GND" H 1505 8827 50  0000 C CNN
F 2 "" H 1500 9000 50  0001 C CNN
F 3 "" H 1500 9000 50  0001 C CNN
	1    1500 9000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 8250 1500 8800
Wire Wire Line
	3800 9250 3800 9400
Connection ~ 3800 9400
Wire Wire Line
	3800 9400 3900 9400
Connection ~ 3900 9400
Wire Wire Line
	3900 9400 3900 9250
Wire Wire Line
	4000 9250 4000 9400
Wire Wire Line
	4000 9400 3900 9400
Wire Wire Line
	3800 9400 3800 9450
Connection ~ 3800 9450
$Comp
L power:GND #PWR06
U 1 1 5EDF6C0F
P 3800 9550
F 0 "#PWR06" H 3800 9300 50  0001 C CNN
F 1 "GND" H 3805 9377 50  0000 C CNN
F 2 "" H 3800 9550 50  0001 C CNN
F 3 "" H 3800 9550 50  0001 C CNN
	1    3800 9550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 9250 3600 9450
Connection ~ 3600 9450
Wire Wire Line
	3600 9450 3800 9450
Wire Wire Line
	3000 9450 3600 9450
Wire Wire Line
	3800 9450 3800 9550
Wire Wire Line
	3000 8950 3000 9450
NoConn ~ 3000 8650
NoConn ~ 3000 8450
NoConn ~ 3000 8250
NoConn ~ 4600 8050
NoConn ~ 4600 8150
NoConn ~ 4600 8250
NoConn ~ 4600 8750
NoConn ~ 4600 8850
NoConn ~ 4600 8950
Wire Notes Line
	6700 5050 6700 11250
Wire Notes Line
	3250 5050 3250 500 
Wire Wire Line
	8800 6850 9450 6850
Wire Wire Line
	9450 6850 9450 6750
Wire Wire Line
	7300 6750 7600 6750
Wire Wire Line
	8800 6750 9100 6750
$Comp
L power:GND #PWR016
U 1 1 5F191E03
P 8200 9550
F 0 "#PWR016" H 8200 9300 50  0001 C CNN
F 1 "GND" H 8205 9377 50  0000 C CNN
F 2 "" H 8200 9550 50  0001 C CNN
F 3 "" H 8200 9550 50  0001 C CNN
	1    8200 9550
	1    0    0    -1  
$EndComp
NoConn ~ 7600 6950
NoConn ~ 7600 7050
NoConn ~ 7600 7950
NoConn ~ 7600 8050
NoConn ~ 7600 8150
NoConn ~ 7600 8250
NoConn ~ 7600 8350
NoConn ~ 7600 8450
$Comp
L Display_Character:WC1602A DS1
U 1 1 5F1E9581
P 13650 7600
F 0 "DS1" H 13650 8581 50  0000 C CNN
F 1 "WC1602A" H 13650 8490 50  0000 C CNN
F 2 "Display:WC1602A" H 13650 6700 50  0001 C CIN
F 3 "http://www.wincomlcd.com/pdf/WC1602A-SFYLYHTC06.pdf" H 14350 7600 50  0001 C CNN
	1    13650 7600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5F1EB1AF
P 14750 7300
F 0 "R13" V 14543 7300 50  0000 C CNN
F 1 "220" V 14634 7300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 14680 7300 50  0001 C CNN
F 3 "~" H 14750 7300 50  0001 C CNN
	1    14750 7300
	0    1    1    0   
$EndComp
Wire Wire Line
	14050 7300 14300 7300
Wire Wire Line
	14050 7400 14650 7400
Wire Wire Line
	14650 7400 14650 7600
$Comp
L Device:R_POT RV1
U 1 1 5F20AB71
P 14450 6600
F 0 "RV1" V 14243 6600 50  0000 C CNN
F 1 "10K" V 14334 6600 50  0000 C CNN
F 2 "Potentiometer_THT:Potentiometer_Bourns_3266W_Vertical" H 14450 6600 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3266.pdf" H 14450 6600 50  0001 C CNN
	1    14450 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	14050 7000 14450 7000
Wire Wire Line
	14450 7000 14450 6750
Wire Wire Line
	14900 7300 15350 7300
Wire Wire Line
	14300 6600 14100 6600
Wire Wire Line
	14100 6600 14100 6400
$Comp
L power:GND #PWR035
U 1 1 5F236EB7
P 14850 6750
F 0 "#PWR035" H 14850 6500 50  0001 C CNN
F 1 "GND" H 14855 6577 50  0000 C CNN
F 2 "" H 14850 6750 50  0001 C CNN
F 3 "" H 14850 6750 50  0001 C CNN
	1    14850 6750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5F237686
P 14650 7600
F 0 "#PWR034" H 14650 7350 50  0001 C CNN
F 1 "GND" H 14655 7427 50  0000 C CNN
F 2 "" H 14650 7600 50  0001 C CNN
F 3 "" H 14650 7600 50  0001 C CNN
	1    14650 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14600 6600 14850 6600
Wire Wire Line
	14850 6600 14850 6750
Wire Wire Line
	13250 7000 12600 7000
Wire Wire Line
	13250 7200 12600 7200
Text Label 12600 7000 0    50   ~ 0
LCD_E
Text Label 12600 7200 0    50   ~ 0
LCD_RS
Text Label 12600 7500 0    50   ~ 0
LCD_D0
Wire Wire Line
	12600 7500 13250 7500
Wire Wire Line
	13250 7600 12600 7600
Wire Wire Line
	13250 7700 12600 7700
Wire Wire Line
	13250 7800 12600 7800
Wire Wire Line
	13250 7900 12600 7900
Wire Wire Line
	13250 8000 12600 8000
Wire Wire Line
	13250 8200 12600 8200
Wire Wire Line
	12600 8100 13250 8100
Text Label 12600 7600 0    50   ~ 0
LCD_D1
Text Label 12600 7700 0    50   ~ 0
LCD_D2
Text Label 12600 7800 0    50   ~ 0
LCD_D3
Text Label 12600 7900 0    50   ~ 0
LCD_D4
Text Label 12600 8000 0    50   ~ 0
LCD_D5
Text Label 12600 8100 0    50   ~ 0
LCD_D6
Text Label 12600 8200 0    50   ~ 0
LCD_D7
Wire Wire Line
	8800 8150 9200 8150
Text Label 9200 8350 0    50   ~ 0
LCD_RS
Text Label 9200 8150 0    50   ~ 0
LCD_E
$Comp
L RF_Module:ESP32-WROOM-32 U3
U 1 1 5F119DD3
P 8200 7950
F 0 "U3" H 8200 9531 50  0000 C CNN
F 1 "ESP32-WROOM-32" H 8200 9440 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 8200 6450 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32_datasheet_en.pdf" H 7900 8000 50  0001 C CNN
	1    8200 7950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 9350 8200 9550
Text Label 9250 9050 0    50   ~ 0
HX_DOUT
Text Label 9250 8950 0    50   ~ 0
HX_SCK
Wire Wire Line
	8800 8950 9250 8950
Wire Wire Line
	8800 9050 9250 9050
Wire Wire Line
	8800 8350 9200 8350
Wire Wire Line
	8800 8050 9200 8050
Text Label 9200 7650 0    50   ~ 0
LCD_D0
Text Label 9200 6950 0    50   ~ 0
LCD_D1
Wire Wire Line
	8800 7950 9200 7950
Text Label 9200 7150 0    50   ~ 0
LCD_D2
Wire Wire Line
	8800 7250 9200 7250
Text Label 9200 7750 0    50   ~ 0
LCD_D3
Wire Wire Line
	8800 7850 9200 7850
Text Label 9200 7850 0    50   ~ 0
LCD_D4
Wire Wire Line
	8800 7750 9200 7750
Text Label 9200 7250 0    50   ~ 0
LCD_D5
Wire Wire Line
	8800 7150 9200 7150
Text Label 9200 7950 0    50   ~ 0
LCD_D6
Wire Wire Line
	8800 6950 9200 6950
Wire Wire Line
	8800 7050 9600 7050
Wire Wire Line
	9600 7050 9600 7150
Text Label 9200 8050 0    50   ~ 0
LCD_D7
Wire Wire Line
	8800 7650 9200 7650
Wire Wire Line
	8800 8850 9250 8850
Wire Wire Line
	8800 8750 9250 8750
Text Label 9200 8550 0    50   ~ 0
BX_TARE
Text Label 9200 8650 0    50   ~ 0
BX_ON_OFF
Wire Wire Line
	8800 8450 9200 8450
Text Label 9200 8450 0    50   ~ 0
BX_TIMER
Wire Wire Line
	8800 8550 9200 8550
Wire Wire Line
	8800 8650 9200 8650
Text Label 9250 8850 0    50   ~ 0
BX_COFFEE_G
Text Label 9250 8750 0    50   ~ 0
BX_H2O_G
NoConn ~ 8800 7350
NoConn ~ 8800 7450
NoConn ~ 8800 7550
Wire Wire Line
	8200 6550 8200 6000
Wire Wire Line
	13650 8600 13650 8400
Wire Wire Line
	12150 7100 13250 7100
Wire Wire Line
	12150 7100 12150 7250
$Comp
L power:GND #PWR022
U 1 1 5F5BC2BB
P 12150 7250
F 0 "#PWR022" H 12150 7000 50  0001 C CNN
F 1 "GND" H 12155 7077 50  0000 C CNN
F 2 "" H 12150 7250 50  0001 C CNN
F 3 "" H 12150 7250 50  0001 C CNN
	1    12150 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5F5BCDA7
P 13650 8600
F 0 "#PWR029" H 13650 8350 50  0001 C CNN
F 1 "GND" H 13655 8427 50  0000 C CNN
F 2 "" H 13650 8600 50  0001 C CNN
F 3 "" H 13650 8600 50  0001 C CNN
	1    13650 8600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13650 6800 13650 6300
NoConn ~ 8800 8250
$Comp
L power:+3.3V #PWR015
U 1 1 5F5F7897
P 8200 6000
F 0 "#PWR015" H 8200 5850 50  0001 C CNN
F 1 "+3.3V" H 8215 6173 50  0000 C CNN
F 2 "" H 8200 6000 50  0001 C CNN
F 3 "" H 8200 6000 50  0001 C CNN
	1    8200 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR017
U 1 1 5F5F952A
P 8550 950
F 0 "#PWR017" H 8550 800 50  0001 C CNN
F 1 "+3.3V" H 8565 1123 50  0000 C CNN
F 2 "" H 8550 950 50  0001 C CNN
F 3 "" H 8550 950 50  0001 C CNN
	1    8550 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5F5FAFBD
P 13650 6300
F 0 "#PWR028" H 13650 6150 50  0001 C CNN
F 1 "+5V" H 13665 6473 50  0000 C CNN
F 2 "" H 13650 6300 50  0001 C CNN
F 3 "" H 13650 6300 50  0001 C CNN
	1    13650 6300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 5F5FB99B
P 14100 6400
F 0 "#PWR032" H 14100 6250 50  0001 C CNN
F 1 "+5V" H 14115 6573 50  0000 C CNN
F 2 "" H 14100 6400 50  0001 C CNN
F 3 "" H 14100 6400 50  0001 C CNN
	1    14100 6400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR036
U 1 1 5F5FBE58
P 15350 7300
F 0 "#PWR036" H 15350 7150 50  0001 C CNN
F 1 "+5V" V 15365 7428 50  0000 L CNN
F 2 "" H 15350 7300 50  0001 C CNN
F 3 "" H 15350 7300 50  0001 C CNN
	1    15350 7300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5F5FCA14
P 3900 6000
F 0 "#PWR07" H 3900 5850 50  0001 C CNN
F 1 "+5V" H 3915 6173 50  0000 C CNN
F 2 "" H 3900 6000 50  0001 C CNN
F 3 "" H 3900 6000 50  0001 C CNN
	1    3900 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6000 3900 6250
$Comp
L power:+5V #PWR013
U 1 1 5F5FD5BC
P 6600 1650
F 0 "#PWR013" H 6600 1500 50  0001 C CNN
F 1 "+5V" H 6615 1823 50  0000 C CNN
F 2 "" H 6600 1650 50  0001 C CNN
F 3 "" H 6600 1650 50  0001 C CNN
	1    6600 1650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5F5FDFEA
P 6650 1300
F 0 "#PWR014" H 6650 1150 50  0001 C CNN
F 1 "+5V" H 6665 1473 50  0000 C CNN
F 2 "" H 6650 1300 50  0001 C CNN
F 3 "" H 6650 1300 50  0001 C CNN
	1    6650 1300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 5F5FE2A1
P 9350 750
F 0 "#PWR018" H 9350 600 50  0001 C CNN
F 1 "+5V" H 9365 923 50  0000 C CNN
F 2 "" H 9350 750 50  0001 C CNN
F 3 "" H 9350 750 50  0001 C CNN
	1    9350 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5F600DE3
P 13800 2400
F 0 "#PWR030" H 13800 2150 50  0001 C CNN
F 1 "GND" H 13805 2227 50  0000 C CNN
F 2 "" H 13800 2400 50  0001 C CNN
F 3 "" H 13800 2400 50  0001 C CNN
	1    13800 2400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 5F61D166
P 12450 1200
F 0 "#PWR023" H 12450 1050 50  0001 C CNN
F 1 "+5V" H 12465 1373 50  0000 C CNN
F 2 "" H 12450 1200 50  0001 C CNN
F 3 "" H 12450 1200 50  0001 C CNN
	1    12450 1200
	1    0    0    -1  
$EndComp
$Comp
L coffee_grams:LM3940 U4
U 1 1 5F62D08E
P 13400 1700
F 0 "U4" H 13500 1925 50  0000 C CNN
F 1 "LM3940" H 13500 1834 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223" H 13400 1700 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Flm3940" H 13400 1700 50  0001 C CNN
	1    13400 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	13800 2400 13800 1800
Wire Wire Line
	13200 1900 13050 1900
Wire Wire Line
	13050 1900 13050 2500
$Comp
L power:GND #PWR025
U 1 1 5F68DC07
P 13050 2500
F 0 "#PWR025" H 13050 2250 50  0001 C CNN
F 1 "GND" H 13055 2327 50  0000 C CNN
F 2 "" H 13050 2500 50  0001 C CNN
F 3 "" H 13050 2500 50  0001 C CNN
	1    13050 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 1700 12650 1700
Wire Wire Line
	12450 1200 12450 1700
Wire Wire Line
	12650 1700 12650 1800
Connection ~ 12650 1700
Wire Wire Line
	12650 1700 13200 1700
$Comp
L Device:C C9
U 1 1 5F6B7CDD
P 12650 1950
F 0 "C9" H 12765 1996 50  0000 L CNN
F 1 ".47u" H 12765 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 12688 1800 50  0001 C CNN
F 3 "~" H 12650 1950 50  0001 C CNN
	1    12650 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5F6B874B
P 12650 2200
F 0 "#PWR024" H 12650 1950 50  0001 C CNN
F 1 "GND" H 12655 2027 50  0000 C CNN
F 2 "" H 12650 2200 50  0001 C CNN
F 3 "" H 12650 2200 50  0001 C CNN
	1    12650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 2100 12650 2200
Wire Wire Line
	13200 2050 13200 2950
$Comp
L power:+3.3V #PWR033
U 1 1 5F6D529C
P 14200 2950
F 0 "#PWR033" H 14200 2800 50  0001 C CNN
F 1 "+3.3V" V 14215 3078 50  0000 L CNN
F 2 "" H 14200 2950 50  0001 C CNN
F 3 "" H 14200 2950 50  0001 C CNN
	1    14200 2950
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 5F6D658B
P 13200 3300
F 0 "C10" H 13315 3346 50  0000 L CNN
F 1 ".1u" H 13315 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 13238 3150 50  0001 C CNN
F 3 "~" H 13200 3300 50  0001 C CNN
	1    13200 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5F6D6F14
P 13550 3300
F 0 "C11" H 13665 3346 50  0000 L CNN
F 1 "10u" H 13665 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 13588 3150 50  0001 C CNN
F 3 "~" H 13550 3300 50  0001 C CNN
	1    13550 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 5F6D721B
P 13900 3300
F 0 "C12" H 14015 3346 50  0000 L CNN
F 1 "33u" H 14015 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 13938 3150 50  0001 C CNN
F 3 "~" H 13900 3300 50  0001 C CNN
	1    13900 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	13200 2950 13550 2950
Wire Wire Line
	13200 3150 13200 2950
Connection ~ 13200 2950
Wire Wire Line
	13550 3150 13550 2950
Connection ~ 13550 2950
Wire Wire Line
	13550 2950 13900 2950
Wire Wire Line
	13900 3150 13900 2950
Connection ~ 13900 2950
Wire Wire Line
	13900 2950 14200 2950
$Comp
L power:GND #PWR027
U 1 1 5F7112C2
P 13550 3600
F 0 "#PWR027" H 13550 3350 50  0001 C CNN
F 1 "GND" H 13555 3427 50  0000 C CNN
F 2 "" H 13550 3600 50  0001 C CNN
F 3 "" H 13550 3600 50  0001 C CNN
	1    13550 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5F711EAB
P 13200 3600
F 0 "#PWR026" H 13200 3350 50  0001 C CNN
F 1 "GND" H 13205 3427 50  0000 C CNN
F 2 "" H 13200 3600 50  0001 C CNN
F 3 "" H 13200 3600 50  0001 C CNN
	1    13200 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 5F712007
P 13900 3600
F 0 "#PWR031" H 13900 3350 50  0001 C CNN
F 1 "GND" H 13905 3427 50  0000 C CNN
F 2 "" H 13900 3600 50  0001 C CNN
F 3 "" H 13900 3600 50  0001 C CNN
	1    13900 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	13200 3450 13200 3600
Wire Wire Line
	13550 3450 13550 3600
Wire Wire Line
	13900 3450 13900 3600
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5F74F9B6
P 14300 7300
F 0 "#FLG01" H 14300 7375 50  0001 C CNN
F 1 "PWR_FLAG" H 14300 7473 50  0000 C CNN
F 2 "" H 14300 7300 50  0001 C CNN
F 3 "~" H 14300 7300 50  0001 C CNN
	1    14300 7300
	1    0    0    -1  
$EndComp
Connection ~ 14300 7300
Wire Wire Line
	14300 7300 14600 7300
Wire Notes Line
	16050 5050 16050 5000
Wire Notes Line
	450  5050 16050 5050
Wire Notes Line
	11450 5000 11450 400 
Wire Notes Line
	11450 400  11500 400 
Wire Notes Line
	11450 5050 11450 11250
Text Notes 3050 10600 0    118  ~ 0
FTDI Chip
Text Notes 8650 10600 0    118  ~ 0
ESP32
Text Notes 13200 9450 0    118  ~ 0
16x2 LCD
Text Notes 13150 4500 0    118  ~ 0
5V to 3.3V
Text Notes 8850 4750 0    118  ~ 0
HX711 Load Cell Amplifier\n
Text Notes 1700 4900 0    118  ~ 0
Tactile Switches
Text Label 7400 3000 0    50   ~ 0
INNA
Text Label 7650 3250 1    50   ~ 0
INPA
$Comp
L Device:C C2
U 1 1 5EE77268
P 2050 7250
F 0 "C2" H 2165 7296 50  0000 L CNN
F 1 ".1u" H 2165 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2088 7100 50  0001 C CNN
F 3 "~" H 2050 7250 50  0001 C CNN
	1    2050 7250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5EE78882
P 2450 7250
F 0 "C3" H 2565 7296 50  0000 L CNN
F 1 "10u" H 2565 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2488 7100 50  0001 C CNN
F 3 "~" H 2450 7250 50  0001 C CNN
	1    2450 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 7100 2050 7100
Wire Wire Line
	2050 7100 2450 7100
Connection ~ 2050 7100
$Comp
L power:GND #PWR03
U 1 1 5EE85109
P 2050 7500
F 0 "#PWR03" H 2050 7250 50  0001 C CNN
F 1 "GND" H 2055 7327 50  0000 C CNN
F 2 "" H 2050 7500 50  0001 C CNN
F 3 "" H 2050 7500 50  0001 C CNN
	1    2050 7500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5EE85598
P 2450 7500
F 0 "#PWR04" H 2450 7250 50  0001 C CNN
F 1 "GND" H 2455 7327 50  0000 C CNN
F 2 "" H 2450 7500 50  0001 C CNN
F 3 "" H 2450 7500 50  0001 C CNN
	1    2450 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 7400 2050 7500
Wire Wire Line
	2450 7400 2450 7500
Wire Wire Line
	2450 6250 2450 7100
Connection ~ 2450 7100
$EndSCHEMATC
