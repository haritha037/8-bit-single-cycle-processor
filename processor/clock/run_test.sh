#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestClock.vvp TestClock.v
vvp TestClock.vvp
