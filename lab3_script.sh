#!/bin/bash
cat /proc/cpuinfo | grep flag | head -1
cd /home/grid/testbed/tb030/lab3/vec_samples/src 
ml icc
array=( "-xSSE3" "-xSSE2" "-xAVX" "-O1", "-O2", "-O3")
for j in "${array[@]}"; do
  for i in {1..3}; do
    a=$(date +%M)
    b=$(date +%S)
    echo icpc -std=c++17 -O$i $j sort.cpp -o result-$a-$b
    icpc -std=c++17 -O$i $j sort.cpp -o result-$a-$b
    echo "$j $i:"
    time ./result-$a-$b
  done 
done