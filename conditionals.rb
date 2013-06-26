def insert_number
puts "Give me a number"
x = gets.to_i
seven(x)
end
def seven(x)
if (x < 7)
	puts "x is less than 7"
elsif (x > 7)
	puts "x is greater than 7"
else
	puts "x is equal to 7"
end
end
insert_number