#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestOr.vvp TestOr.v
vvp TestOr.vvp
