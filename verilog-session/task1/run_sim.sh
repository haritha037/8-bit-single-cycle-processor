#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o logic_selector.vvp logic_selector.v
vvp logic_selector.vvp

