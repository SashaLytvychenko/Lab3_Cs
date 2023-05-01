#!/bin/bash
cat /proc/cpuinfo | grep flag | head -1
cd /home/grid/testbed/tb030/lab3/vec_samples/src
ml icc
optimizer=( "-xSSE3" "-xSSE2" "-xAVX" )
for optim in "${optimizer[@]}"; do
  for label in {1..3}; do
    filename1=$(date +%M)
    filename2=$(date +%S)
    echo icpc -std=c++17 -O$label $optim sort.cpp -o go-$filename1-$filename2
    icpc -std=c++17 -O$label $optim sort.cpp -o go-$filename1-$filename2
    echo "$optim $label:"
    time ./go-$filename1-$filename2
  done 
done