class String
	def <=> (other)
		self.chars.sort.join.casecmp other.chars.sort.join
	end
	def == (other)
	    (self <=> other).to_i == 0
	end
end

def combine_anagrams(words)
	anagrams = []
	words.map do |word|
		anagrams << words.select {|word2| word2 == word && !anagrams.flatten.include?(word2)}
	end
	anagrams.reject {|anagram| anagram.empty?}
end

#words = ['cars', 'for', 'potatoes', 'Racs', 'four','scar', 'creAMs', 'ScReam']
#words = ['c']
#[["cars", "Racs", "scar"], ["four"], ["for"], ["potatoes"], ["creams", "scream"]]
#puts combine_anagrams(words).to_s