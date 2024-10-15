#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestControlUnit.vvp TestControlUnit.v
vvp TestControlUnit.vvp
