# CPU Design Documentation

## Overview

Supporting instructions: `ADD`, `SUB`, `OR`, `MOV`, and `LOADI`.

## PORTS

input

- `instruction`
- reset
- clk

output:

- `pc` (the address of the next instruction)

## Control Unit

### Instruction splitting

- **OP-CODE**: Bits [31-24]
- **RD / IMM-jump, branch**: Bits [23-16]
- **RT**: Bits [15-8]
- **RS / IMM**: Bits [7-0]

### Control Signals Generation

Based on the extracted OP-CODE, the control unit generates the necessary control signals to facilitate instruction execution.

## Instruction Fetching Mechanism

### Program Counter (PC)

The program counter is responsible for keeping track of the current instruction address. It includes the following features:

- **Increment**: A dedicated adder increments the program counter.
- **Read Instructions**: Instructions are read asynchronously based on the PC address.

### Instruction Memory

The instruction memory consists of the following attributes:

- **Storage**: Keeps the instructions as an array.
- **Size**: 1024 bytes, allowing for 256 instructions.
- **Implementation**: Created within the `TestCPU` module.

## Additional Points

- **Two's Complement**: Utilized for handling signed integers.
- **Multiplexers (MUXs)**: Employed for selecting data paths based on control signals.

## Delays

The following delays are associated with different stages of instruction processing:

1. **PC Update**: `#1`
2. **Instruction Memory Read**: `#2`
3. **Instruction Decode**:
   - Control Signal Generation: `#1`
   - Wiring the Split Instructions: `#0`
4. **Two's Complement Calculation**: `#1`
5. **PC Adder**: `#1`

## CPU Reset

if reset=1 -> write 0 to PC at the `positive clk edge`
reset the register file as well

## Summary

This document provides a foundational overview of the CPU architecture, detailing its control unit functionality, instruction fetching mechanism, memory organization, and processing delays.
