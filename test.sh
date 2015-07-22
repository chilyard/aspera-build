#!/bin/bash


interfaces=("eth2" "eth3" "eth4" "eth5")
hashLength=${#interfaces[@]}

for ((i=0; i<${hashLength}; i++));

do
echo "ifcfg: ${interfaces["$i"]}"
cat << HereDoc > ifcfg-${interfaces["$i"]} 
DEVICE=${interfaces["$counter"]}
BOOTPROTO=static
ONBOOT=yes
BROADCAST=0.0.0.0
NETWORK=0.0.0.0
NETMASK=0.0.0.0
IPADDR=0.0.0.0
USERCTL=no
HereDoc
done
