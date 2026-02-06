# 8-bit Processor / ALU Design (VHDL)

This project presents the **design and implementation of an 8-bit Arithmetic Logic Unit (ALU)** using VHDL, developed as part of an academic course on digital systems and computer architecture.

## Overview
The processor components are built **from basic logic gates**, following a modular and hierarchical hardware design approach.

## Implemented Components
- Arithmetic Logic Unit (ALU)
- Arithmetic unit (ADD, SUB, INC, DEC, ADC)
- Logic unit (AND, OR, NOT, XOR)
- 1-bit and 8-bit logic gates (AND, OR, NAND, NOR, XOR, NXOR)
- Multiplexers (2:1)
- Carry-in and carry-out logic
- 8-bit adders

## Architecture
- Modular VHDL files for each functional unit
- Opcode-based operation selection
- Clear separation between arithmetic and logic paths
- Datapath-oriented design

## Technologies
- VHDL
- Digital Logic Design
- Hardware Description Languages (HDL)

## Intended Use
This project is **academic in nature** and focuses on understanding low-level processor construction rather than implementing a commercial CPU architecture.

## How to Simulate
1. Open the project in a VHDL-compatible simulator (GTKWave, ModelSim, Vivado, etc.).
2. Compile all modules.
3. Run test benches (if available) or simulate the ALU top module.

## Future Improvements
- Instruction memory and control unit
- Register file
- Program counter
- Expanded instruction set

## Author
Santiago Saucedo Mendoza