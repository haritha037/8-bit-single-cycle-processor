#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o AndUnit8.vvp AndUnit8.v
vvp AndUnit8.vvp
