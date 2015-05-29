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
asplicense="12345"
ipmiaddr="10.1.1.1"
ipmigw="10.1.1.2"

nodePPFile = "./"+@hostname+".pp"

print "nodeppfile: ",nodePPFile,"\n"

if (File.file?(nodePPFile)) 
	print "node file already exists\n\n"  
	else "creating file\n\n"
end

File.open(nodePPFile,File::WRONLY|File::CREAT|File::EXCL) { |file|
file.print "testing"
}












