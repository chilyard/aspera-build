
class TheCobblers

	def initialize()
		print "TheCobblers constructor<br>" if $Verbose == "TRUE"
	end

	def pleasebeexecute(hashOptions) 	
		print "pleasebeexecute() called<br>" if $Verbose == "TRUE"
		# how-to add a system to cobbler.  example data included
		#
		# cobbler system add --name=asdk-digitrini-p001 --profile=PRODUCTION_ASPERA-LEGACY:5:Vubiquity-Production \
		# --interface=eth0 --mac-address=0C:C4:7A:50:BB:68 --netboot-enabled=Y
		# 
		# if you want to add a second interface
		# cobbler system edit --name=asdk-digitrini-p001 --interface=eth1 --mac-address=0C:C4:7A:50:BB:69
		
		# set instance vars
		@hostname = hashOptions["hostname"]
		@eth0mac = hashOptions["eth0mac"]
		@eth1mac = hashOptions["eth1mac"]
		@eth1ip = hashOptions["eth1ip"]

		
		IO.popen("/usr/bin/cobbler system add --name=#{@hostname} \
		--profile=PRODUCTION_ASPERA-LEGACY:5:Vubiquity-Production --interface=eth0 --mac-address=#{@eth0mac} \
		--netboot-enabled=Y")
		IO.popen("/usr/bin/cobbler system edit --name=#{@hostname} --interface=eth1 --mac-address=#{@eth1mac} \
		--ip-address=#{@eth1ip}")
	end

end	
