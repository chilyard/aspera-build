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

if (File.file?("/etc/puppet/modules/asperaclient/files/license/96969.aspera-license"))
	print "aspera license found"

	else
	print "aspera license missing"
end
