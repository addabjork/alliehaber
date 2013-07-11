require 'nokogiri'
require 'open-uri'

class FootballPlayer
	attr_accessor :position, :stats, :name, :nfl_team, :id



end

players = [{:name => "Aaron Rodgers", :position => "QB", :nfl_team => "Green Bay Packers", :id => "8439"},
{:name => "Cam Newton", :position => "QB", :nfl_team => "Carolina Panthers", :id => "13994"},
{:name => "Christian Ponder", :position => "QB", :nfl_team => "Minnesota Vikings", :id => "13966"},
{:name => "Adrian Peterson", :position => "RB", :nfl_team => "Minnesota Vikings", :id => "10452"},
{:name => "Marshawn Lynch", :position => "RB", :nfl_team => "Seattle Seahawks", :id => "10456"},
{:name => "Doug Martin", :position => "RB", :nfl_team => "Tampa Bay Buccaneers", :id => "14885"},
{:name => "Alfred Morris", :position => "RB", :nfl_team => "Washington Redskins", :id => "15009"},
{:name => "Brandon Marshal", :position => "WR", :nfl_team => "Chicago Bears", :id => "9705"},
{:name => "Reggie Wayne", :position => "WR", :nfl_team => "Indianapolis Colts", :id => "2578"},
{:name => "Wes Welker", :position => "WR", :nfl_team => "Denver Broncos", :id => "5941"},
{:name => "Victor Cruz", :position => "WR", :nfl_team => "New York Giants", :id => "13553"}
 ]



def getdata(players, position)
	player = players[position]
	players_id = player[:id]

	espn_url = "http://espn.go.com/nfl/player/_/id/#{players_id}"

	@doc = Nokogiri::HTML(open("#{espn_url}"))
end



class FootballPlayer
	def getdata(players, position)
	player = players[position]
	players_id = player[:id]

	espn_url = "http://espn.go.com/nfl/player/_/id/#{players_id}"

	@doc = Nokogiri::HTML(open("#{espn_url}"))
end
end
	
class Quaterback
	def tellpassyards(player, passingyards)
		role = player[:position]
		puts role
			if role == "QB"
				puts "#{player[:name]} has #{passingyards} passing yards"
			else
				puts "not a quarter back"
			end
	end
	def getpassingyards(position, players)
		getdata(players, position)

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(4)').each do |data|
 			@passingyards = data.content 
 		end

			puts "lalal #{@passingyards}"
	
			tellpassyards(player, @passingyards)
	end

end

class Runningback
	def tellrushyards(player, rushingyards)
		role = player[:position]
		puts role
			if role == "RB"
				puts "#{player[:name]} has #{rushingyards} rushing yards"
			else
				puts "not a running back"
			end
	end
	def getrushyards(position, players)
		getdata(players, position)

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(3)').each do |data|
 			@rushingyards = data.content 
 		end

		puts "lalal #{@rushingyards}"
	
		tellrushyards(player, @rushingyards)
	end

	def tellreceivingyardsrb(player, receivingyardsrb)
		role = player[:position]
		puts role
			if role == "RB"
				puts "#{player[:name]} has #{receivingyardsrb} receiving yards"
			else
				puts "not a running"
			end
	end

	def getreceivingyardsrb(position, players)
		getdata(players, position)

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(9)').each do |data|
 			@receivingyardsrb = data.content 
 		end

			puts "lalal #{@receivingyardsrb}"
		
			tellreceivingyardsrb(player, @receivingyardsrb)
	end
end

class Receivers
	def tellreceivingyardswr(player, receivingyardswr)
		role = player[:position]
		puts role
			if role == "WR"
				puts "#{player[:name]} has #{receivingyardswr} receiving yards"
			else
				puts "not a receiver"
			end
end

	def getreceivingyardswr(position, players)
		getdata(players, position)

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(4)').each do |data|
 			@receivingyardswr = data.content 
 		end

			puts "lalal #{@receivingyardswr}"
	
			tellreceivingyardswr(player, @receivingyardswr)
	end	

end