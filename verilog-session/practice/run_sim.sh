#!/bin/bash
# Script to compile and run the Verilog code

iverilog -Wall -o practice.vvp practice.v
vvp practice.vvp
