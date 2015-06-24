#!/usr/bin/env ruby

# this ssh class will handle all ssh connections.  
#
# a hash is created upon instantiation.  as connections are opened and closed the pid will be popped
# on/off the hash

require 'net/ssh'

Class SshConnection

	def initialize()
		print "initializing connection hash"
		connectionHash = {}
		
	end

	def open()
		print "opening connection to "
	end

	def closeConnection()
		print "closing connection to "
	end

	def execCommand()
		print "executing command "
	end

Net::SSH.start("localhost","root",:password => pwd ) do |session|
		begin
			session.exec('/usr/sbin/useradd -c "test user" -m --password testpass -s /bin/bash testuser')
		rescue SystemCallError
			$stderr.print "ssh connection failed: " + $!
		end
	end
end 



