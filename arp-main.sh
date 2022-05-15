#!/bin/bash

INTER=eth0
INTER_EXIST=$(ifconfig -a | grep -w $INTER)

if [[ -n $INTER_EXIST ]]; then
	date
	arp -ni $INTER | awk '{print $1 " | " $3}' | awk "FNR >= 2" 
else 
	echo "eth0: error fetching interface information: Device not found"
fi
