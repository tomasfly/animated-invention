#!/bin/bash
echo "Network Information:"
echo "---------------------"
echo "Interfaces:"
ip addr show
echo
echo "Routing Table:"
ip route show
echo
echo "Active Connections:"
netstat -tunlp
