#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestMux_8x1_8bit.vvp TestMux_8x1_8bit.v
vvp TestMux_8x1_8bit.vvp
