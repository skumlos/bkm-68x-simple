EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "BKM-68X Alternative"
Date ""
Rev "F"
Comp "L33T TEK"
Comment1 "Martin Hejnfelt"
Comment2 "martin@hejnfelt.com"
Comment3 "www.immerhax.com"
Comment4 ""
$EndDescr
$Sheet
S 800  750  2500 1300
U 5F1E9444
F0 "Video" 60
F1 "bkm-68x-video.sch" 60
$EndSheet
$Sheet
S 850  2500 2500 1350
U 5F2607C8
F0 "Connectors" 60
F1 "connectors.sch" 60
$EndSheet
$Sheet
S 3500 2500 2500 1300
U 5F272BF7
F0 "Powersupply" 60
F1 "power-supply.sch" 60
$EndSheet
$Sheet
S 3550 750  2450 1300
U 5F269FDE
F0 "FPGA" 60
F1 "fpga.sch" 60
$EndSheet
Wire Notes Line
	850  6000 3050 6000
Wire Notes Line
	3050 6000 3050 4550
Wire Notes Line
	3050 4550 850  4550
Wire Notes Line
	850  4550 850  6000
Text Notes 1700 4500 0    50   ~ 0
MECHANICAL
$Comp
L Mechanical:MountingHole H1
U 1 1 60AB1DD9
P 1150 4900
F 0 "H1" H 1250 4946 50  0000 L CNN
F 1 "Keystone 7794" H 1250 4855 50  0000 L CNN
F 2 "keystone-7794:7794-X" H 1150 4900 50  0001 C CNN
F 3 "~" H 1150 4900 50  0001 C CNN
	1    1150 4900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 60AB2057
P 1150 5600
F 0 "H2" H 1250 5646 50  0000 L CNN
F 1 "Keystone 7794" H 1250 5555 50  0000 L CNN
F 2 "keystone-7794:7794-X" H 1150 5600 50  0001 C CNN
F 3 "~" H 1150 5600 50  0001 C CNN
	1    1150 5600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
