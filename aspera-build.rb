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
# TODO: create editable text file for management of properties (hostname, eth0ip, etc.)

$Verbose = "TRUE"

print "Content-type: text/html\n\n"
print "<html><body><font color=green>performing syntax check</font><br></body></html>"

# "classes" - might as well be functions
require 'cgi'
require './keyvaluecheck.rb'
require './createnodepp.rb'
require './cobbler.rb'

# create an object of the form parameters 
cgi = CGI.new('html5')
# our hash from the cgi params
cgiFields = cgi.params 



# ******************************************
# process the form and verify its content
# ******************************************

# create an instance of keyvaluecheck
kvcheck = KeyValueCheck.new

# track the amount of errors found in the submitted data, report back to user
Errorcount = 0

# verify the content and quality of that content prior to taking any action.
#
# loop through the parameters, verify the string value, write it out to the appropriate file(s)
cgiFields.each_pair do |key,value|
	# print the values as we process
	print "processing: #{key}:#{value}<br>" if $Verbose == "TRUE"

	# the first key should be the hostname.  it's used to create the node manifest file
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




# ******************************************
# time to create a node.pp file
# ******************************************
# create the node.pp file;chown puppet:puppet the newly created node.pp file

# create a createnodepp object
createpp = CreateNodePP.new
Returnstatus = createpp.build(cgiFields)

# if a check fails, note the error to the user and set a flag so that we don't create
# any files or cobbler entries until the errors are fixed and resubmitted
print "Errorcount:", Errorcount, "<br>" if $Verbose == "TRUE"
if Errorcount >= 1
	print "<b><font color=red>createNodePP has errors, check the file prior to initial boot</font></b><br>"
	exit
end


# ******************************************
# execute the cobblers 
# ******************************************
cobblerExec = TheCobblers.new
Returnstatus = cobblerExec.pleasebeexecute(cgiFields)

# if a check fails, note the error to the user and set a flag so that we don't create
# any files or cobbler entries until the errors are fixed and resubmitted
print "Errorcount:", Errorcount, "<br>" if $Verbose == "TRUE"
if Errorcount >= 1
	print "<b><font color=red>we suffered an ERROR while creating the cobbler entries</font></b><br>"
	exit
end


# check the aspera license file
# add fes configuration to the node.pp file 
# static routes

# create the field_prep.sh script.  this is to be executed prior to shutdown and shipment
# to the affiliate


