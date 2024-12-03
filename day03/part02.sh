#!/bin/bash 
#grep -Po 'mul\(\d{1,3},\d{1,3}\)' input.txt | awk -F'[\\(,\\)]' '{print $2 * $3}' | awk '{total += $1}END{print total}'

grep -Po "mul\(\d{1,3},\d{1,3}\)|do\(\)|don\'t\(\)" test_input02.txt | sed -e "s/'//"


grep -Po "mul\(\d{1,3},\d{1,3}\)|do\(\)|don\'t\(\)" input.txt |sed -e "s/'//" | awk -F'[\\(,\\)]' '/mul/{print $2 * $3} /do/{print $1} /dont/{print $1}'


