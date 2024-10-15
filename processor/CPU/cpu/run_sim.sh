#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestCpu.vvp TestCpu.v
vvp TestCpu.vvp
