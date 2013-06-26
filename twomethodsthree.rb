def always3
	insert_number
end


def insert_number
	puts "Give me a number"
	number = gets.to_i
	compute_number(number)
end

def compute_number(x)
	x = ((x + 5) * 2 - 4 )/ 2 - x
	puts x
end

always3