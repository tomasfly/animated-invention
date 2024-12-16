#!/bin/bash
echo "Disk Information:"
echo "------------------"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT
echo
df -h
