#!/bin/bash
echo "CPU Information:"
echo "-----------------"
lscpu
echo
cat /proc/cpuinfo | grep "model name" | uniq
