#!/bin/env ruby

# dumb script to handle data sent from web form /var/www/html/pub/aspera-build.html
# 
# puppet #
# specifically /etc/puppet/manifests/mynodes/FIELD/hostname.pp
#
# cobbler #
# cobbler uses json, we might be able to create a json file and import it w/ the cobbler tool
# otherwise we need to call the cobbler binary w/ values from the form input
#
#

$Verbose = "FALSE"

print "Content-type: text/html\n\n"
print "<html><body><font color=green>performing syntax check</font><br></body></html>"

require 'cgi'
require './keyvaluecheck.rb'

cgi = CGI.new('html5')

# create an object of the form parameters
fields = cgi.params 

# create an instance of keyvaluecheck
kvcheck = KeyValueCheck.new

# track the amount of errors found in the submitted data, report back to user
Errorcount = 0

# loop through the parameters, verify the string value, write it out to the appropriate file(s)
fields.each_pair do |key,value|
	# print the values as we process
	print "processing: #{key}:#{value}<br>" if $Verbose == "TRUE"

	# the first key should be the hostname.  use it to create the node manifest file
	if key == "hostname" 
		print "create a backup of the hostname.pp file<br>" if $Verbose == "TRUE"
		print "open a file handle for the new manifest file<br>" if $Verbose == "TRUE" 
		# else do nothing
	end
		
	# for each key/value pair, pass each to the string check class
	Returnstatus = kvcheck.check("#{key}","#{value}")
	Errorcount += Returnstatus

	# if a check fails, note the error to the user and set a flag so that we don't create
	# any files or cobbler entries until the errors are fixed and resubmitted
end

# if a check fails, note the error to the user and set a flag so that we don't create
# any files or cobbler entries until the errors are fixed and resubmitted
print "Errorcount >= 1:", Errorcount, "<br>" if $Verbose == "TRUE"
if Errorcount >= 1
	print "<b>syntax errors found, fix the items above in <font color=red>red</font></b><br>"
	print "<b>and resubmit.</b><br>"
	exit
end

# after verifying the form data, write out to the necessary files and call cobbler
print "<font color=green>syntax check complete!</font><br>"

# create the node.pp file;chown puppet:puppet the newly created node.pp file
#nodeppFile = "/tmp/",hostname+".pp"
print "opening file</br>"

nodePPFile = "/tmp/"+fields["hostname"]+".pp"

#print "nodePPFile: ",nodePPFile,"<br>"

#File.exist?(nodePPFile)

File.open("#{nodePPFile}",File::WRONLY|File::CREAT|File::EXCL) { |file| 
file.print "node \'", fields["hostname"],"\' inherits asdk_us {\n"
file.print "	$asperalicense = \"",fields["asplicense"],"\"\n"
file.print "	$ipmiaddr = \"",fields["ipmiip"],"\"\n"
file.print "	$ipmigw = \"",fields["ipmigw"],"\"\n"
file.print "	$MGMT = \"eth0\"\n"
file.print "	$ASP = \"eth1\"\n"
file.print "	$CUST = \"eth2\"\n"
file.print "\n"
file.print "	include asdk_firewalld\n"
file.print "	include ipmi\n"
file.print "	include asperaclient\n"
file.print "	include fes\n"
file.print " }\n"
file.close
}


# execute cobbler 
# check the aspera license file
# add fes configuration to the node.pp file 


# create the field_prep.sh script.  this is to be executed prior to shutdown and shipment
# to the affiliate










