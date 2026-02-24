## ===============================
## CLOCK (100 MHz)
## ===============================
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk [get_ports clk]

## ===============================
## ULTRASONIC SENSOR (JA HEADER)
## ===============================

## TRIG -> JA1
set_property PACKAGE_PIN J1 [get_ports trig]
set_property IOSTANDARD LVCMOS33 [get_ports trig]

## ECHO -> JA2  (Use Voltage Divider!)
set_property PACKAGE_PIN L2 [get_ports echo]
set_property IOSTANDARD LVCMOS33 [get_ports echo]

## ===============================
## LEDs (3 LEDs)
## ===============================
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports led[*]]

## ===============================
## 7-Segment Display (Common Anode)
## ===============================

## Segments
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports seg[*]]

## Anodes
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports an[*]]