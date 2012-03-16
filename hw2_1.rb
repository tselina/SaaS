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

class String
	def palindrome?
		self.chars.palindrome?
	end
end

module Enumerable
	def palindrome?
		result = false
		testString = self.respond_to?('values') ? self.values.join : self.to_a.join
#puts self.values.join
#puts testString
		testString.downcase!()
		noSpaces = testString.gsub(/\s+|\W+/, "")
		if noSpaces == noSpaces.reverse()
			result = true
		end
		result
	end
end
# testStrings = [
	# "A man, a plan, a canal -- Panama",
	# "ISAPALINILAPASI, ",
	# "A,>T=OYOTA",
	# "Madam, I'm Adam!)",
	# "Abracadabra",
	# "foo",
	# [1,2,3,2,1],
	# [1,3,3,2,1],
	# {"a"=>1,'b'=>2, 'c'=>3, 'd'=>2, 'e'=>1},
	# {'dog' => 'canine', 'cat' => 'feline', 'donkey' => 'asinine', 12 => 'dodecine'}
# ]
# testStrings.each do |testString|
	# puts testString.inspect.to_s + ' ' + testString.palindrome?.to_s
# end