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

$Verbose = "TRUE"

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
	print "<b>and resubmit.</b>"
	exit
end

# after verifying the form data, write out to the necessary files and call cobbler
print "<font color=green>syntax check complete!</font><br>"


# create the node.pp file;chown puppet:puppet the node.pp file
filename = hostname+".pp"

File.open(filename,File::WRONLY|File::CREAT|File::EXCL) do |file|
	file << "node \'asdk-digitrini-p001\' inherits asdk_us {\n"
	file << "$asperalicense = asplicense"
end



# execute cobbler 
# check the aspera license file
# add fes configuration to the node.pp file 


# create the field_prep.sh script.  this is to be executed prior to shutdown and shipment
# to the affiliate























