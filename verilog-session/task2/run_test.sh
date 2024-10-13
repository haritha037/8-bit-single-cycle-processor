#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o TestUpCounter_4bit.vvp TestUpCounter_4bit.v
vvp TestUpCounter_4bit.vvp
