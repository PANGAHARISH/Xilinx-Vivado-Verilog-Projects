# Sequence Detector Design

## Overview
This project implements a **Sequence Detector** using Verilog HDL. The design detects a specific sequence of bits (e.g., `1011`) in an input stream. Both **Mealy** and **Moore state machine** approaches are implemented.

## Features
- Detects a target bit sequence (configurable in the design).
- Designed using both Mealy and Moore state machines.
- Testbench to validate detection.

## File Structure
Sequence-Detector-Design/
├── src/                        # Verilog source files
│   ├── sequence_detector_mealy.v # Mealy state machine implementation
│   ├── sequence_detector_moore.v # Moore state machine implementation
│   └── sequence_detector_top.v   # Top-level design
├── tb/                         # Testbench files
│   └── sequence_detector_tb.v  # Testbench for verification
├── constraints/                # Xilinx constraints file (.xdc)
├── sim/                        # Simulation results (waveforms/logs)
└── README.md                   # Project documentation

