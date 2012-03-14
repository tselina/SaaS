def palindrome?(testString)
	result = false
	testString.downcase!()
	noSpaces = testString.gsub(/\s+|\W+/, "")
	if noSpaces == noSpaces.reverse()
	    result = true
	end
	result
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

def count_words(testString)
	wordsArray = Hash.new(0)
	testString = testString.downcase().scan(/\w+/)
	testString.uniq.each {|word| wordsArray[word] = testString.count(word)}
	wordsArray
end

#puts count_words("A man, a plan, a canal -- Panama")
#puts count_words("Doo bee doo bee doo")
puts count_words("what the what the what")
puts count_words("there is UPPER upper case")