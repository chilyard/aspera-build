#
## use this class to check on the key/value pair passed from the web form
#
# not elegant. fix at a later date.

class KeyValueCheck

	## constructor
	def initialize()
		print "creating instance of KeyValueCheck<br>" if $Verbose == "TRUE" 	
	end
	
	## check function
	def check(key,value)
		case key
		
		# hostname
		when "hostname"
			if value.match("asdk-*-p???")
				print "hostname looks good<br>" if $Verbose == "TRUE"	
				return 0

				else
				print "<b><font color=red>hostname is bad, m'kay.</font></b><br>"
				return 1
			end
		
		# eth0mac
		when "eth0mac"
			if value.match(/([0-9A-F]{2}[:-]){5}[0-9A-F]{2}$/i)
				print "eth0 MAC looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth0 MAC is bad</font></b><br>"
				return 1
			end

		# eth0ip
		when "eth0ip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth0ip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth0ip is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth0sm
		when "eth0sm"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth0sm looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth0sm is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth0gw
		when "eth0gw"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth0gw looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth0gw is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth1mac
		when "eth1mac"
			if value.match(/([0-9A-F]{2}[:-]){5}[0-9A-F]{2}$/i)
				print "eth1mac looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth1mac is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth1ip
		when "eth1ip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth1ip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth1ip is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth1sm
		when "eth1sm"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth1sm looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth1sm is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth1gw
		when "eth1gw"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth1gw looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth1gw is bad, m'kay.</font></b><br>"
				return 1
		end

		# check the asperastaticroute value
		when "asperastaticroute"
			if value.match(/^eth[0-5]/i)
				print "asperastaticroute looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>asperastaticroute is b0rked, m'kay.</font></b><br>"
				return 1
		end

		# eth2ip
		when "eth2ip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth2ip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth2ip is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth2sm
		when "eth2sm"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth2sm looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth2sm is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth2gw
		when "eth2gw"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth2gw looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth2gw is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth3ip
		when "eth3ip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth3ip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth3ip is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth3sm
		when "eth3sm"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth3sm looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth3sm is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth3gw
		when "eth3gw"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth3gw looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth3gw is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth4ip
		when "eth4ip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth4ip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth4ip is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth4sm
		when "eth4sm"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth4sm looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth4sm is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth4gw
		when "eth4gw"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth4gw looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth4gw is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth5ip
		when "eth5ip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth5ip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth5ip is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth5sm
		when "eth5sm"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth5sm looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth5sm is bad, m'kay.</font></b><br>"
				return 1
		end

		# eth5gw
		when "eth5gw"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "eth5gw looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>eth5gw is bad, m'kay.</font></b><br>"
				return 1
		end

		# ipmiip
		when "ipmiip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "ipmiip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>ipmiip is bad, m'kay.</font></b><br>"
				return 1
		end

		# ipmism
		when "ipmism"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "ipmism looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>ipmism is bad, m'kay.</font></b><br>"
				return 1
		end

		# ipmigw
		when "ipmigw"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "ipmigw looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>ipmigw is bad, m'kay.</font></b><br>"
				return 1
		end

		# asplicense
		when "asplicense"
			if value.match(/[0-9]{1,5}/)
				print "asplicense looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>asplicense is bad, m'kay.</font></b><br>"
				return 1
		end

		# festype
		when "fesmovetype"
			if value.match(/pull|sftp_push|ftp_push/)
				print "fesmovetype looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>fesmovetype is bad, m'kay.</font></b><br>"
				return 1
		end

		# fesftpusername
		when "fesftpusername"
			if value.match(/(.*)/)
				print "fesftpusername looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>fesftpusername is bad, m'kay.</font></b><br>"
				return 1
		end

		# fesftppassword
		when "fesftppassword"
			if value.match(/(.*)/)
				print "fesftppassword looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>fesftppassword is bad, m'kay.</font></b><br>"
				return 1
		end

		# fesftpserverip
		when "fesftpserverip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "fesftpserverip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>fesftpserverip is bad, m'kay.</font></b><br>"
				return 1
		end

		# fessftpusername
		when "fessftpusername"
			if value.match(/(.*)/)
				print "fessftpusername looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>fessftpusername is bad, m'kay.</font></b><br>"
				return 1
		end

		# fessftppassword
		when "fessftppassword"
			if value.match(/(.*)/)
				print "fessftppassword looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>fessftppassword is bad, m'kay.</font></b><br>"
				return 1
		end

		# fessftpserverip
		when "fessftpserverip"
			if value.match(/^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/i)
				print "fessftpserverip looks good<br>" if $Verbose == "TRUE"
				return 0

				else
				print "<b><font color=red>fessftpserverip is bad, m'kay.</font></b><br>"
				return 1
		end

		# test mode
		when "verbosemode"
			if value.match(/true/i)
				print "enabling test mode<br>" 	
				$Verbose = "TRUE"
				return 0

				else
				print "<b><font color=red>verbosemode is bad, m'kay.</font></b><br>"
				return 1
		end

		# else
		else
			print "unknown key: ", key, "<br>" if $Verbose == "TRUE"
			return 0
		end 
		## end case statement
	end
	## end check function definition

end
## class end

