#
# class to handle creation of the puppet node manifest file for the aspera field docker build
# 
# interface: pass key,value pair from CGI object.  parse into the pp file.

class CreateNodePP

	# CreateNodePP Constructor
	def initialize()
		print "creating instance of CreateNodePP </br>" if $Verbose == "TRUE"
		@nodePPDir = "/tmp/"
	end

	# Build the file using key,value passed to this function. source hash is in the main prog
	def build(hashOptions)
		print "in CreateNodePP::build<br>" if $Verbose == "TRUE"
		@hostname = "#{hashOptions["hostname"]}"
		@nodePPFile = "/tmp/#{@hostname}.pp"
		if (File.file?(@nodePPFile))
    		print "#{@nodePPFile} already exists - <font color=red>verify what's at this location. you'll need to \
			remove the existing #{@nodePPFile} in order to complete this process.  click shift-reload \
			when you're ready to proceed.</font><br>"

    		else print "creating #{@nodePPFile} file<br>"
    		File.open(@nodePPFile,File::WRONLY|File::CREAT|File::EXCL) { |file|
				#print "createnodepp: #{key}:#{value}<br>" if $Verbose == "TRUE"
				file.print "node \'", hashOptions["hostname"],"\' inherits asdk_us {\n"
				file.print "	$asperalicense = \"",hashOptions["asplicense"],"\"\n"
				file.print "	$ipmiaddr = \"",hashOptions["ipmiip"],"\"\n"
				file.print "	$ipmigw = \"",hashOptions["ipmigw"],"\"\n"
				file.print "	$ipmism = \"",hashOptions["ipmism"],"\"\n"
				file.print "	$MGMT = \"eth0\"\n"
				file.print "	$ASP = \"eth1\"\n"
				file.print "	$CUST = \"eth2\"\n"
				file.print "	$eth0mac = \"",hashOptions["eth0mac"],"\"\n" 
				file.print "	$eth0ip = \"",hashOptions["eth0ip"],"\"\n"   
				file.print "	$eth0sm = \"",hashOptions["eth0sm"],"\"\n"  
				file.print "	$eth0gw = \"",hashOptions["eth0gw"],"\"\n"  
				file.print "	$eth1mac = \"",hashOptions["eth1mac"],"\"\n"  
				file.print "	$eth1ip = \"",hashOptions["eth1ip"],"\"\n"  
				file.print "	$eth1sm = \"",hashOptions["eth1sm"],"\"\n"  
				file.print "	$eth1gw = \"",hashOptions["eth1gw"],"\"\n"  
				file.print "	$eth2mac = \"",hashOptions["eth2mac"],"\"\n"  
				file.print "	$eth2ip = \"",hashOptions["eth2ip"],"\"\n"  
				file.print "	$eth2sm = \"",hashOptions["eth2sm"],"\"\n"  
				file.print "	$eth2gw = \"",hashOptions["eth2gw"],"\"\n"  
				file.print "	$eth3mac = \"",hashOptions["eth3mac"],"\"\n"  
				file.print "	$eth3ip = \"",hashOptions["eth3ip"],"\"\n"  
				file.print "	$eth3sm = \"",hashOptions["eth3sm"],"\"\n"  
				file.print "	$eth3gw = \"",hashOptions["eth3gw"],"\"\n"  
				file.print "	$eth4mac = \"",hashOptions["eth4mac"],"\"\n"  
				file.print "	$eth4ip = \"",hashOptions["eth4ip"],"\"\n"  
				file.print "	$eth4sm = \"",hashOptions["eth4sm"],"\"\n"  
				file.print "	$eth4gw = \"",hashOptions["eth4gw"],"\"\n"  
				file.print "	$eth5mac = \"",hashOptions["eth5mac"],"\"\n"  
				file.print "	$eth5ip = \"",hashOptions["eth5ip"],"\"\n"  
				file.print "	$eth5sm = \"",hashOptions["eth5sm"],"\"\n"  
				file.print "	$eth5gw = \"",hashOptions["eth5gw"],"\"\n"  
				file.print " 	$fesftpusername = \"",hashOptions["fesftpusername"],"\"\n"  
				file.print " 	$fesftppassword = \"",hashOptions["fesftppassword"],"\"\n"  
				file.print " 	$fesftpserverip = \"",hashOptions["fesftpserverip"],"\"\n"  
				file.print " 	$fessftpusername = \"",hashOptions["fessftpusername"],"\"\n"  
				file.print " 	$fessftppassword = \"",hashOptions["fessftppassword"],"\"\n"  
				file.print " 	$fessftpserverip = \"",hashOptions["fesftpserverip"],"\"\n"  
				file.print "\n"
				file.print "	include asdk_firewalld\n"
				file.print "	include ipmi\n"
				file.print "	include asperaclient\n"
				file.print "	include fes\n"
				file.print " }\n"
				file.close
    		}
			print "setting ownership of #{@nodePPFile}<br>" if $Verbose == "TRUE"
			# note the sudo call.  have to update sudoers for the apache group to allow this specific command
    		IO.popen("sudo chown puppet:puppet #{@nodePPFile}")
		end
	end
end
