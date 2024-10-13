#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o test_or_unit_8bit.vvp test_or_unit_8bit.v
vvp test_or_unit_8bit.vvp
