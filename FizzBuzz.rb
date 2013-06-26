def insert_number(numbers)
	(numbers).each do |x|
			if (x % 3 == 0 and x % 5 == 0)
		puts "FizzBuzz"
			elsif (x % 3 == 0)
		puts "Fizz"
			elsif (x % 5 == 0)
		puts "Buzz"
			else
		puts x
		end
	end
end
puts "insert a number from 1-100"
x = gets.to_i
insert_number(1..x)