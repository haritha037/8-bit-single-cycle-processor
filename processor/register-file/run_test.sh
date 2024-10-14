#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestRegisterFile.vvp TestRegisterFile.v
vvp TestRegisterFile.vvp
