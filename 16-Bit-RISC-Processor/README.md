# 16-Bit RISC Processor

## Overview
This project implements a **16-bit Reduced Instruction Set Computing (RISC) Processor** using Verilog HDL. The processor includes an Arithmetic Logic Unit (ALU), Control Unit, and Register File to perform basic arithmetic, logical, and control operations.

## Features
- **16-bit data path**
- **ALU**: Supports basic arithmetic and logical operations.
- **Control Unit**: Decodes instructions and manages processor states.
- **Register File**: Includes general-purpose registers for data storage.
- **Testbench**: Verifies functionality through simulation.

## File Structure
16-Bit-RISC-Processor/
├── src/                # Verilog source files
│   ├── alu.v           # ALU module
│   ├── control_unit.v  # Control unit module
│   ├── register_file.v # Register file module
│   └── processor.v     # Top-level processor design
├── tb/                 # Testbench files
│   └── processor_tb.v  # Testbench for verification
├── constraints/        # Xilinx constraints file (.xdc)
├── sim/                # Simulation results (waveforms/logs)
└── README.md           # Project documentation



## Tools Used
- **Design**: Xilinx Vivado
- **Language**: Verilog HDL
- **Simulation**: Vivado Simulator

## How to Run
1. Open **Xilinx Vivado** and create a new project.
2. Import the source files from the `src/` directory.
3. Add the **testbench** file from the `tb/` directory.
4. Run **simulation** to verify functionality.
5. (Optional) Implement the design on an FPGA board.

## Simulation Results
Example simulation waveforms are included in the `sim/` folder:
![Waveform](sim/waveform.png)

## Author
**Harish Panga**  
Final-Year M.Tech, Communication Systems, IIT Roorkee
