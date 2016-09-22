def caesar_cipher(string, shift)
	letters = string.split("")
	numbers, shifted_letters = [], []
	letters.each { |letter| numbers.push(letter.ord) }
	numbers.each do |number|
		if number.between?(65,90)
			number += shift
			if number > 90; number -= 26 end
		elsif number.between?(97,122)
			number += shift
			if number > 122; number -= 26 end
		end
		shifted_letters.push(number.chr)
	end
	puts shifted_letters.join
end

caesar_cipher("The quick brown fox jumps Over the lazy dog", 17)