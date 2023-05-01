#!/bin/bash
cd /home/grid/testbed/tb030/lab3/vec_samples/src 
ml icc
optimizer=( "-xSSE2" "-xSSE3" "-xAVX"  )
for optim in "${optimizer[@]}"; do
  for label in {1..3}; do
    filename1=$(date +%M)
    filename12=$(date +%S)
    echo icpc -std=c++17 -O$label $optim  sort.cpp -o go-$filename1-$filename2
    icpc -std=c++17 -O$label $optim  sort.cpp -o go-$filename1-$filename2
    echo "$optim  $label:"
    time ./go-$filename11-$filename12
  done 
done