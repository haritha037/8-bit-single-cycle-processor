#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o OrUnit8.vvp OrUnit8.v
vvp OrUnit8.vvp
