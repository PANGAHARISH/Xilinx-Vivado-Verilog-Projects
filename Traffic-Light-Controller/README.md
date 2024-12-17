# Traffic Light Controller

## Overview
This project implements a **Traffic Light Controller** using Verilog HDL. The design uses both **Mealy** and **Moore state machines** to control traffic light signals efficiently.

## Features
- State machine-based design (Mealy and Moore models).
- Simulates traffic light operation for **Red**, **Yellow**, and **Green** lights.
- Testbench to validate timing and transitions.

## File Structure
Traffic-Light-Controller/
├── src/                      # Verilog source files
│   ├── traffic_light_mealy.v # Mealy state machine implementation
│   ├── traffic_light_moore.v # Moore state machine implementation
│   └── traffic_light_top.v   # Top-level design
├── tb/                       # Testbench files
│   └── traffic_light_tb.v    # Testbench for verification
├── constraints/              # Xilinx constraints file (.xdc)
├── sim/                      # Simulation results (waveforms/logs)
└── README.md                 # Project documentation



## Tools Used
- **Design**: Xilinx Vivado
- **Language**: Verilog HDL
- **Simulation**: Vivado Simulator

## How to Run
1. Open **Xilinx Vivado** and create a new project.
2. Import the Verilog files from the `src/` directory.
3. Add the testbench file from the `tb/` directory.
4. Run simulation to verify traffic light behavior.

## State Machine Diagrams
- **Mealy State Machine**: Outputs depend on the current state and inputs.  
- **Moore State Machine**: Outputs depend only on the current state.  

## Simulation Results
Example waveform for traffic light sequence:  
![Traffic Light Simulation](sim/traffic_light_waveform.png)

## Author
**Harish Panga**  
Final-Year M.Tech, Communication Systems, IIT Roorkee

