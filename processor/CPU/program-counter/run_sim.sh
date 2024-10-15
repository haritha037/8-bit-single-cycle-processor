#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestProgramCounter.vvp TestProgramCounter.v
vvp TestProgramCounter.vvp
