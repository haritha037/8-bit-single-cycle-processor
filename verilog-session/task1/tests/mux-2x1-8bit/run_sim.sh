#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o test_mux_2x1_8bit.vvp test_mux_2x1_8bit.v
vvp test_mux_2x1_8bit.vvp
