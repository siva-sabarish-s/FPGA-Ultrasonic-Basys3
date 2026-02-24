# FPGA-Ultrasonic-Basys3
FPGA-based ultrasonic distance measurement system using HC-SR04 sensor on Basys 3 (Artix-7). Displays real-time distance in cm on 4-digit 7-segment with LED range indication.

# 🚀 FPGA Ultrasonic Distance Measurement System

## 📌 Overview
This project implements a real-time ultrasonic distance measurement system using the HC-SR04 sensor and the Basys 3 FPGA board (Artix-7). The measured distance is displayed in centimeters on a 4-digit 7-segment display, with LED indicators representing different distance ranges.

## 🛠 Hardware Used
- Basys 3 FPGA (Artix-7)
- HC-SR04 Ultrasonic Sensor
- External 5V Power Supply
- Voltage Divider (10kΩ + 4.7kΩ)
- Breadboard & Jumper Wires

## ⚙️ Features
- Distance measurement in centimeters
- 4-digit multiplexed 7-segment display
- LED distance indication:
  - < 10 cm → LED0 (Short)
  - 10–30 cm → LED1 (Medium)
  - > 30 cm → LED2 (Long) 
- 100 MHz clock operation
- Proper echo timing calculation
- Voltage protection for FPGA (3.3V logic)

## 🔌 Pin Configuration
| Signal | Basys 3 Pin |
|--------|-------------|
| TRIG   | JA1 |
| ECHO   | JA2 (via voltage divider) |
| Clock  | W5 (100 MHz) |

## 📂 Project Structure
