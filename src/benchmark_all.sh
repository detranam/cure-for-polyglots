#!/bin/bash

lsDirectories="$(ls -d */)"
directories=($lsDirectories)

for dir in "${directories[@]}"
do
  cd $dir
  # How should I be passing parameters to each src module? EG for how many items to push/pop
  ./benchmark_this.sh
  cd ..
done