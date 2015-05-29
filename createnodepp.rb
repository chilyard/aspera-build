#
# class to handle creation of the puppet node manifest file for the aspera field docker build
# 
# interface: pass key,value pair from CGI object.  parse into the pp file.

class CreateNodePP

	# CreateNodePP Constructor
	#
	def initialize()
		print "creating instance of CreateNodePP </br>" if $Verbose == "TRUE"
		@nodePPDir = "/tmp/"
	end

	# Build the file using key,value passed to this function.  ignore anything we don't need
	def build(key,value)
		case
		when "hostname"
			
		when "eth0mac"
		when "eth0ip"
		when "eth0sm"
		when "eth0gw"
		when "eth1mac"
		when "eth1ip"
		when "eth1sm"
		when "eth1gw"
		when "eth2ip"
		when "eth2sm"
		when "eth2gw"
		when "eth3ip"
		when "eth3sm"
		when "eth3gw"
		when "eth4ip"
		when "eth4sm"
		when "eth4gw"
		when "eth5ip"
		when "eth5sm"
		when "eth5gw"
		when "ipmiip"
		when "ipmism"
		when "ipmigw"
		when "asplicense"
		# the following are not yet implemented.  the fes module needs to include
		#when "fesftpusername"
		#when "fesftppassword"
		#when "fesftpserverip"
		#when "fessftpusername"
		#when "fessftppassword"
		#when "fessftpserverip"
		else
			print "unused value", key, "</br>" if $Verbose == "TRUE"
		end

	#@hostname = "/tmp/"+fields["hostname"]+".pp"
	print "hostname: ",@hostname,"</br>"
	#nodePPFile = "/tmp/"+@hostname+".pp"
	#print "nodePPFile: ",nodePPFile,"<br>"
	
	if (File.file?(nodePPFile))
    	print "node file already exists\n\n"
    	else "creating file\n\n"
	end

	#File.open(nodePPFile,File::WRONLY|File::CREAT|File::EXCL) { |file|
	#file.print "node \'", fields["hostname"],"\' inherits asdk_us {\n"
	#file.print "    $asperalicense = \"",fields["asplicense"],"\"\n"
	#file.print "    $ipmiaddr = \"",fields["ipmiip"],"\"\n"
	#file.print "    $ipmigw = \"",fields["ipmigw"],"\"\n"
	#file.print "    $MGMT = \"eth0\"\n"
	#file.print "    $ASP = \"eth1\"\n"
	#file.print "    $CUST = \"eth2\"\n"
	#file.print "\n"
	#file.print "    include asdk_firewalld\n"
	#file.print "    include ipmi\n"
	#file.print "    include asperaclient\n"
	#file.print "    include fes\n"
	#file.print " }\n"
	#file.close
	#}
	
	end

end
