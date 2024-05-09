#!/bin/bash

# Define the filename
filename="hes.txt"


# Use awk to sum up the percentage columns and compute the total
awk -F, 'NR > 1 {r_percent += $5; c_percent += $6} END {total = r_percent + c_percent; printf "R: %.5f, C: %.5f, Total: %.5f\n", r_percent, c_percent, total}' $filename
