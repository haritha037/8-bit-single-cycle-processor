#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o Mux_2x1_8bit.vvp Mux_2x1_8bit.v
vvp Mux_2x1_8bit.vvp
