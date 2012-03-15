class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency)
	singular_currency = currency.to_s.gsub( /s$/, '')

    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
	
  end
end

#puts 20.euro.in(:dollars)
#puts 5.dollars.in(:euros)  # 5 / 1.292
# puts 10.euros.in(:rupees)  #
# puts 1.dollar.in(:rupees)
# puts 1.dollar.in(:rupee)
# puts 10.rupees.in(:euro)
# puts 10.rupee.in(:euro)    

def palindrome?(testString)
	result = false
	testString.downcase!()
	noSpaces = testString.gsub(/\s+|\W+/, "")
	if noSpaces == noSpaces.reverse()
	    result = true
	end
	result
end

class String
	def palindrome?
		result = false
		self.downcase!()
		noSpaces = self.gsub(/\s+|\W+/, "")
		if noSpaces == noSpaces.reverse()
			result = true
		end
		result
	end
end
#testStrings = [
#	"A man, a plan, a canal -- Panama",
#	"ISAPALINILAPASI, ",
#	"A,>T=OYOTA",
#	"Madam, I'm Adam!)",
#	"Abracadabra"
#]
#testStrings.each do |testString|
#	puts palindrome?(testString)
#end
#puts 'foo'.palindrome?
#puts "ISAPALINILAPASI, ".palindrome?