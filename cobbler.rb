#
# handles calls to cobbler
#
## TODO: 
# add checks on the system calls
# add delete function



class TheCobblers

	def initialize()
		print "TheCobblers constructor<br>" if $Verbose == "TRUE"
	end

	def pleasebeexecute(hashOptions) 	
		print "pleasebeexecute() called<br>" if $Verbose == "TRUE"
		# how-to add a system to cobbler.  **examples only** included
		#
		# cobbler system add --name=asdk-digitrini-p001 --profile=PRODUCTION_ASPERA-LEGACY:5:Vubiquity-Production \
		# --interface=eth0 --mac-address=0C:C4:7A:50:BB:68 --netboot-enabled=Y
		# 
		# if you want to add a second interface
		# cobbler system edit --name=asdk-digitrini-p001 --interface=eth1 --mac-address=0C:C4:7A:50:BB:69
		
		# set instance vars
		@hostname = hashOptions["hostname"]
		@fqdnhostname = "#{@hostname}"+".vubiquity.com"
		@eth0mac = hashOptions["eth0mac"]
		@eth1mac = hashOptions["eth1mac"]
		@eth1ip = hashOptions["eth1ip"]

		print "eth1ip is unset or eth1ip is unset<br>" if @eth1ip.empty? || @eth1mac.empty? 

		print "creating cobbler entries<br>" if $Verbose == "TRUE"
		IO.popen("/usr/bin/cobbler system add --name=#{@hostname} --hostname=#{@fqdnhostname} \
		--profile=PRODUCTION_ASPERA-LEGACY:5:Vubiquity-Production --interface=eth0 --mac-address=#{@eth0mac} \
		--netboot-enabled=Y") do |io|
			io.close
			end

		if $?.to_i > 0	
			print "<font color=red>COBBLER add failed!</font><br>" if $?.to_i > 0 
			return 1

			else
			# need to wait a couple seconds for the previous command to complete and update the cobbler DB
			sleep(2)
			IO.popen("/usr/bin/cobbler system edit --name=#{@hostname} --interface=eth1 --mac-address=#{@eth1mac} \
			--ip-address=#{@eth1ip}")
		end # end if $?.to_i

	end # end pleasebeexecute

end	# end class TheCobblers	
