#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestAnd.vvp TestAnd.v
vvp TestAnd.vvp
