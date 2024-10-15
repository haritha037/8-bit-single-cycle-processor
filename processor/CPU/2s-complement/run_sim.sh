#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestNegator.vvp TestNegator.v
vvp TestNegator.vvp
