def insert_temp
	puts "plug in a temperature"
	temp = gets.to_i
	puts "How fast are the winds?"
	winds = gets.to_i
	puts "How are the weather conditions?"
	cond = gets.chomp.downcase
	whattodo(temp, winds, cond)
end
def whattodo(temp, winds, cond)
	if (temp > 85 and winds < 25 and cond == "sunny")
		puts "You should wear shorts and take off your shirt"
	elsif (temp > 65 and winds < 25 and cond == "sunny")
		puts "You should wear shorts"
	elsif (temp < 50 and cond == "sunny")
		puts "You should wear a jacket"
	elsif (cond == "raining")
			puts "Wear a raincoat"
	elsif (temp > 85 and winds > 70 and cond == "sunny")
		puts "get inside"
	elsif (temp > 85 and winds < 70 and cond == "sunny")
		puts "Take off your shirt"
	else
		puts "You have weird conditions, ask someone else"
	end
end	
insert_temp