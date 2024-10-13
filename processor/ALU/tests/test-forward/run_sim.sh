#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestForward.vvp TestForward.v
vvp TestForward.vvp
