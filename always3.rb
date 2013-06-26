def always3
	puts "Give me a number"
	number = gets.to_i; number = ((number + 5) * 2 - 4 )/ 2 - number
	puts number
end
always3
