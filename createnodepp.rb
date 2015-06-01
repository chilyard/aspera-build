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
	def build(hashOptions)
		hashOptions.each_pair do |key,value| 
			print "createnodepp: #{key}:#{value}<br>"
		end
	end

=begin
	if (File.file?(nodePPFile))
    	print "node file already exists\n\n"

    	else "creating file\n\n"
    	File.open(nodePPFile,File::WRONLY|File::CREAT|File::EXCL) { |file|
    	file.print "file.print"
    	}
    		IO.popen("chown puppet:puppet #{nodePPFile}")
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
=end

end
