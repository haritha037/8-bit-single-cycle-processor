#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestInstructionSplitter.vvp TestInstructionSplitter.v
vvp TestInstructionSplitter.vvp
