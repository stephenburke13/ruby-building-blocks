def substrings (string, dictionary)
	result = Hash.new(0)
	words = string.downcase.split(" ")
	words.each do |word|
		dictionary.each do |test_word|
			if word.include?(test_word)
				result[test_word] += 1
			end
		end
	end
	puts result.to_s
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)