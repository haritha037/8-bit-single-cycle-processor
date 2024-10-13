#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o test_and_unit_8bit.vvp test_and_unit_8bit.v
vvp test_and_unit_8bit.vvp
