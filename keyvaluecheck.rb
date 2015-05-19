#
## use this class to check on the key/value pair passed from the web form
#

class KeyValueCheck

	def initialize()
		print "creating instance of KeyValueCheck<br>" 	
	end
	
	def check(key,value)
		case key
		when "hostname" 
			print "key:", key, "\tvalue:", value, "<br>" 
		when "eth0mac"
			print "checking eth0mac:", value, "<br>"
			print "length of mac:", value.length, "<br>"
			if value.match(/([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}/i)
				print "eth0 MAC looks good<br>"

			# let's do a second check.  perhaps the user omitted the colons.  if that's the case
			# we'll insert the colons for them. string should be 12 chars w/ an alpha-numeric mix
			elsif
				value.match(/[a-z]{0,12}/i)	
				print "eth0 MAC matches quantity and type of chars, converting it<br>"
				#convertedmac = value.gsub(/.{1,2}/, ':')
				#print "new eth0:", convertedmac, "<br>"
			else
				print "eth0 MAC is weird, you'll need to fix it.<br>"	
			end
		else
			print "unknown value<br>"
		end
	end

end
