#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestAdd.vvp TestAdd.v
vvp TestAdd.vvp
