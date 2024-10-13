#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestAlu.vvp TestAlu.v
vvp TestAlu.vvp
