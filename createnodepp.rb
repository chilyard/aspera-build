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
		@nodePPFile = "/etc/puppet/manifests/mynodes/FIELD/#{@hostname}.pp"
		if (File.file?(@nodePPFile))
    		print "#{@nodePPFile} already exists - <font color=red>verify what's at this location. you'll need to \
			remove the existing #{@nodePPFile} in order to complete this process.  click shift-reload \
			when you're ready to proceed.</font><br>"
			exit

    		else print "creating #{@nodePPFile} file<br>"
    		File.open(@nodePPFile,File::WRONLY|File::CREAT|File::EXCL) { |file|
				#print "createnodepp: #{key}:#{value}<br>" if $Verbose == "TRUE"
				file.print "node \'", hashOptions["hostname"],"\' inherits asdk_us {\n"
				file.print "\n	\#Aspera Configuration\n"
				file.print "	$asperalicense = \"",hashOptions["asplicense"],"\"\n"
				file.print "\n	\#IPMI Configuration\n"
				file.print "	$ipmiaddr = \"",hashOptions["ipmiip"],"\"\n"
				file.print "	$ipmigw = \"",hashOptions["ipmigw"],"\"\n"
				file.print "	$ipmism = \"",hashOptions["ipmism"],"\"\n"
				file.print "	$MGMT = \"eth0\"\n"
				file.print "	$ASP = \"eth1\"\n"
				file.print "	$CUST = \"eth2\"\n"

				# ***************************
				# networking
				# ***************************
				file.print "\n	\#Network Configuration - See: https://forge.puppetlabs.com/razorsedge/network\n"

				# 8.29.164.128/26 via 104.244.226.17 dev bond0
				file.print "	network::route { \'",hashOptions["asperastaticroute"],"\':\n"
				file.print "	ipaddress	=>	['8.29.164.128', ],\n" 
				file.print "	netmask		=>	['255.255.255.192', ],\n" 
				file.print "	gateway		=> 	[\'",hashOptions["asperastaticroute"],"\', ],\n"
				file.print "	}\n"

				# eth0
				file.print "	network::if::static { \'eth0\':\n"
				file.print "	ensure		=> \'up\',\n" 				
				file.print "	ipaddress	=> \'",hashOptions["eth0ip"],"\',\n"
				file.print "	netmask		=> \'",hashOptions["eth0sm"],"\',\n"
				file.print "	gateway		=> \'",hashOptions["eth0gw"],"\',\n"
				file.print "	macaddress	=> \'",hashOptions["eth0mac"],"\',\n"
				file.print "	}\n"

				# eth1
				file.print "	network::if::static { \'eth1\':\n"
				file.print "	ensure		=> \'up\',\n" 				
				file.print "	ipaddress	=> \'",hashOptions["eth1ip"],"\',\n"
				file.print "	netmask		=> \'",hashOptions["eth1sm"],"\',\n"
				file.print "	gateway		=> \'",hashOptions["eth1gw"],"\',\n"
				file.print "	macaddress	=> \'",hashOptions["eth1mac"],"\',\n"
				file.print "	}\n"
				
				# eth2
				file.print "	network::if::static { \'eth2\':\n"
				file.print "	ensure		=> \'up\',\n" 				
				file.print "	ipaddress	=> \'",hashOptions["eth2ip"],"\',\n"
				file.print "	netmask		=> \'",hashOptions["eth2sm"],"\',\n"
				file.print "	gateway		=> \'",hashOptions["eth2gw"],"\',\n"
				file.print "	macaddress	=> \'",hashOptions["eth2mac"],"\',\n"
				file.print "	}\n"

				# eth3
				file.print "	network::if::static { \'eth3\':\n"
				file.print "	ensure		=> \'up\',\n" 				
				file.print "	ipaddress	=> \'",hashOptions["eth3ip"],"\',\n"
				file.print "	netmask		=> \'",hashOptions["eth3sm"],"\',\n"
				file.print "	gateway		=> \'",hashOptions["eth3gw"],"\',\n"
				file.print "	macaddress	=> \'",hashOptions["eth3mac"],"\',\n"
				file.print "	}\n"

				# eth4
				file.print "	network::if::static { \'eth4\':\n"
				file.print "	ensure		=> \'up\',\n" 				
				file.print "	ipaddress	=> \'",hashOptions["eth4ip"],"\',\n"
				file.print "	netmask		=> \'",hashOptions["eth4sm"],"\',\n"
				file.print "	gateway		=> \'",hashOptions["eth4gw"],"\',\n"
				file.print "	macaddress	=> \'",hashOptions["eth4mac"],"\',\n"
				file.print "	}\n"

				# eth5
				file.print "	network::if::static { \'eth5\':\n"
				file.print "	ensure		=> \'up\',\n" 				
				file.print "	ipaddress	=> \'",hashOptions["eth5ip"],"\',\n"
				file.print "	netmask		=> \'",hashOptions["eth5sm"],"\',\n"
				file.print "	gateway		=> \'",hashOptions["eth5gw"],"\',\n"
				file.print "	macaddress	=> \'",hashOptions["eth5mac"],"\',\n"
				file.print "	}\n"

				# FES configuration
				file.print "\n	\#FES Configuration\n"
				file.print " 	$fesmovetype = \"",hashOptions["fesmovetype"],"\"\n"  
				file.print " 	$fesftpusername = \"",hashOptions["fesftpusername"],"\"\n"  
				file.print " 	$fesftppassword = \"",hashOptions["fesftppassword"],"\"\n"  
				file.print " 	$fesftpserverip = \"",hashOptions["fesftpserverip"],"\"\n"  
				file.print " 	$fessftpusername = \"",hashOptions["fessftpusername"],"\"\n"  
				file.print " 	$fessftppassword = \"",hashOptions["fessftppassword"],"\"\n"  
				file.print " 	$fessftpserverip = \"",hashOptions["fesftpserverip"],"\"\n"  

				# includes
				file.print "\n	\#Includes\n"
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
