#!/bin/env ruby

# we're updating cobbler and puppet node manifest files
# 
# puppet #
# specifically /etc/puppet/manifests/mynodes/FIELD/hostname.pp
#
# cobbler #
# cobbler uses json, we might be able to create a json file and import it w/ the cobbler tool
# otherwise we need to call the cobbler binary w/ values from the form input
#
#


# create the node.pp file;chown puppet:puppet the newly created node.pp file
@hostname="asdk-test-p001"
@eth0mac = "00:00:00:00:00:01"
@eth1mac = "00:00:00:00:00:02"
@eth1ip = "192.168.100.100"


IO.popen("/usr/bin/cobbler system add --name=#{@hostname} --profile=PRODUCTION_ASPERA-LEGACY:5:Vubiquity-Production --interface=eth0 --mac-address=#{@eth0mac} --netboot-enabled=Y") 
IO.popen("/usr/bin/cobbler system edit --name=#{@hostname} --interface=eth1 --mac-address=#{@eth1mac} --ip-address=#{@eth1ip}") 


