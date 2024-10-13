#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o task1.vvp task1.v
vvp task1.vvp
