EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:tinkerforge
LIBS:solid_state_relay-cache
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Solid State Relay Bricklet"
Date "23 may 2014"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2014, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
NoConn ~ 4100 3650
$Comp
L GND #PWR01
U 1 1 509A86EF
P 4500 3250
F 0 "#PWR01" H 4500 3250 30  0001 C CNN
F 1 "GND" H 4500 3180 30  0001 C CNN
F 2 "" H 4500 3250 60  0001 C CNN
F 3 "" H 4500 3250 60  0001 C CNN
	1    4500 3250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 509A86E5
P 4100 3100
F 0 "#PWR02" H 4100 3200 30  0001 C CNN
F 1 "VCC" H 4100 3200 30  0000 C CNN
F 2 "" H 4100 3100 60  0001 C CNN
F 3 "" H 4100 3100 60  0001 C CNN
	1    4100 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 509A86CD
P 4900 3900
F 0 "#PWR03" H 4900 3900 30  0001 C CNN
F 1 "GND" H 4900 3830 30  0001 C CNN
F 2 "" H 4900 3900 60  0001 C CNN
F 3 "" H 4900 3900 60  0001 C CNN
	1    4900 3900
	1    0    0    -1  
$EndComp
Text Notes 550  7200 0    40   ~ 0
Copyright Tinkerforge GmbH 2014.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L DRILL U2
U 1 1 4C6050A2
P 10700 6700
F 0 "U2" H 10750 6750 60  0001 C CNN
F 1 "DRILL" H 10700 6700 60  0000 C CNN
F 2 "DRILL_NP" H 10700 6700 60  0001 C CNN
F 3 "" H 10700 6700 60  0001 C CNN
	1    10700 6700
	1    0    0    -1  
$EndComp
$Comp
L DRILL U3
U 1 1 4C60509F
P 11050 6700
F 0 "U3" H 11100 6750 60  0001 C CNN
F 1 "DRILL" H 11050 6700 60  0000 C CNN
F 2 "DRILL_NP" H 11050 6700 60  0001 C CNN
F 3 "" H 11050 6700 60  0001 C CNN
	1    11050 6700
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4C5FD6ED
P 4300 3200
F 0 "C1" V 4450 3200 50  0000 L CNN
F 1 "100nF" V 4150 3100 50  0000 L CNN
F 2 "0603" H 4300 3200 60  0001 C CNN
F 3 "" H 4300 3200 60  0001 C CNN
	1    4300 3200
	0    -1   -1   0   
$EndComp
$Comp
L CAT24C U1
U 1 1 4C5FD337
P 4500 3950
F 0 "U1" H 4350 4450 60  0000 C CNN
F 1 "M24C64" H 4500 3950 60  0000 C CNN
F 2 "SOIC8" H 4500 3950 60  0001 C CNN
F 3 "" H 4500 3950 60  0001 C CNN
	1    4500 3950
	-1   0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 4C5FCFB4
P 3550 3350
F 0 "#PWR04" H 3550 3450 30  0001 C CNN
F 1 "VCC" H 3550 3450 30  0000 C CNN
F 2 "" H 3550 3350 60  0001 C CNN
F 3 "" H 3550 3350 60  0001 C CNN
	1    3550 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 4C5FCF5E
P 3650 3700
F 0 "#PWR05" H 3650 3700 30  0001 C CNN
F 1 "GND" H 3650 3630 30  0001 C CNN
F 2 "" H 3650 3700 60  0001 C CNN
F 3 "" H 3650 3700 60  0001 C CNN
	1    3650 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 4C5FCF4F
P 2950 4600
F 0 "#PWR06" H 2950 4600 30  0001 C CNN
F 1 "GND" H 2950 4530 30  0001 C CNN
F 2 "" H 2950 4600 60  0001 C CNN
F 3 "" H 2950 4600 60  0001 C CNN
	1    2950 4600
	1    0    0    -1  
$EndComp
$Comp
L CON-SENSOR P1
U 1 1 4C5FCF27
P 2950 3900
F 0 "P1" H 2700 4450 60  0000 C CNN
F 1 "CON-SENSOR" V 3100 3900 60  0000 C CNN
F 2 "CON-SENSOR" H 2950 3900 60  0001 C CNN
F 3 "" H 2950 3900 60  0001 C CNN
	1    2950 3900
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR07
U 1 1 5200DCC6
P 3400 3300
F 0 "#PWR07" H 3400 3390 20  0001 C CNN
F 1 "+5V" H 3400 3390 30  0000 C CNN
F 2 "" H 3400 3300 60  0000 C CNN
F 3 "" H 3400 3300 60  0000 C CNN
	1    3400 3300
	1    0    0    -1  
$EndComp
NoConn ~ 3400 4350
$Comp
L GND #PWR08
U 1 1 523C3180
P 5850 4600
F 0 "#PWR08" H 5850 4600 30  0001 C CNN
F 1 "GND" H 5850 4530 30  0001 C CNN
F 2 "" H 5850 4600 60  0001 C CNN
F 3 "" H 5850 4600 60  0001 C CNN
	1    5850 4600
	1    0    0    -1  
$EndComp
$Comp
L MOSFET_N Q1
U 1 1 5200DC67
P 5750 4050
F 0 "Q1" H 5760 4220 60  0000 R CNN
F 1 "2N7002P" H 5760 3900 60  0000 R CNN
F 2 "SOT23GDS" H 5750 4050 60  0001 C CNN
F 3 "" H 5750 4050 60  0000 C CNN
	1    5750 4050
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 532028E9
P 4950 4300
F 0 "R1" V 5030 4300 50  0000 C CNN
F 1 "10k" V 4950 4300 50  0000 C CNN
F 2 "0603" H 4950 4300 60  0001 C CNN
F 3 "" H 4950 4300 60  0000 C CNN
	1    4950 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 532028F6
P 4950 4600
F 0 "#PWR09" H 4950 4600 30  0001 C CNN
F 1 "GND" H 4950 4530 30  0001 C CNN
F 2 "" H 4950 4600 60  0001 C CNN
F 3 "" H 4950 4600 60  0001 C CNN
	1    4950 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3200 4500 3250
Wire Wire Line
	5000 3850 4900 3850
Wire Wire Line
	5000 3850 5000 3650
Wire Wire Line
	5000 3650 4900 3650
Wire Wire Line
	4100 3850 3400 3850
Wire Wire Line
	3550 3350 3550 3650
Wire Wire Line
	3550 3650 3400 3650
Wire Wire Line
	2950 4600 2950 4500
Wire Wire Line
	3400 3550 3650 3550
Wire Wire Line
	3650 3550 3650 3700
Wire Wire Line
	4100 3750 3400 3750
Wire Wire Line
	4900 3850 4900 3900
Wire Wire Line
	4900 3650 4900 3550
Connection ~ 4900 3650
Connection ~ 4900 3850
Wire Wire Line
	4100 3550 4100 3100
Connection ~ 4100 3200
Wire Wire Line
	3400 3950 5050 3950
Wire Wire Line
	5050 3950 5050 3750
Wire Wire Line
	5050 3750 4900 3750
Wire Wire Line
	3400 3450 3400 3300
Wire Wire Line
	3400 4050 5550 4050
Connection ~ 4950 4050
Wire Wire Line
	4950 4600 4950 4550
Wire Wire Line
	5850 4250 5850 4600
NoConn ~ 3400 4250
NoConn ~ 3400 4150
$Comp
L +5V #PWR010
U 1 1 53202A4E
P 5850 3150
F 0 "#PWR010" H 5850 3240 20  0001 C CNN
F 1 "+5V" H 5850 3240 30  0000 C CNN
F 2 "" H 5850 3150 60  0000 C CNN
F 3 "" H 5850 3150 60  0000 C CNN
	1    5850 3150
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 53202A54
P 5850 3450
F 0 "R2" V 5930 3450 50  0000 C CNN
F 1 "1k" V 5850 3450 50  0000 C CNN
F 2 "0603" H 5850 3450 60  0001 C CNN
F 3 "" H 5850 3450 60  0000 C CNN
	1    5850 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3850 6100 3850
Wire Wire Line
	6100 3850 6100 3600
Wire Wire Line
	6100 3500 6100 3200
Wire Wire Line
	6100 3200 5850 3200
Wire Wire Line
	5850 3200 5850 3150
Wire Wire Line
	5850 3700 5850 3850
Connection ~ 5850 3850
Connection ~ 5850 3200
$Comp
L TST P2
U 1 1 537F4FAC
P 6100 3600
F 0 "P2" H 6100 3900 40  0000 C CNN
F 1 "TST" H 6100 3850 30  0000 C CNN
F 2 "Drill" H 6100 3600 60  0001 C CNN
F 3 "" H 6100 3600 60  0000 C CNN
	1    6100 3600
	0    1    1    0   
$EndComp
$Comp
L TST P3
U 1 1 537F4FB9
P 6100 3500
F 0 "P3" H 6100 3800 40  0000 C CNN
F 1 "TST" H 6100 3750 30  0000 C CNN
F 2 "Drill" H 6100 3500 60  0001 C CNN
F 3 "" H 6100 3500 60  0000 C CNN
	1    6100 3500
	0    1    1    0   
$EndComp
$EndSCHEMATC
