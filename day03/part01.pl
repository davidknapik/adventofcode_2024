#!/bin/bash 
grep -Po 'mul\(\d{1,3},\d{1,3}\)' input.txt | awk -F'[\\(,\\)]' '{print $2 * $3}' | awk '{total += $1}END{print total}'
