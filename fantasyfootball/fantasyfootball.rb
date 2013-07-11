require 'nokogiri'
require 'open-uri'


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


class FootballPlayer
	attr_accessor :position, :stats, :name, :nfl_team, :id

	def getdata
		players_id = self.id
		espn_url = "http://espn.go.com/nfl/player/_/id/#{players_id}"
		@doc = Nokogiri::HTML(open("#{espn_url}"))
		puts self.name
	end
end
	
class Quarterback < FootballPlayer

	def tellpassyards
		role = self.position
		puts role
		if role == "QB"
			puts "#{self.name} has #{@passingyards} passing yards"
		else
			puts "not a quarter back"
		end
	end
	
	def getpassingyards
		self.getdata

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(4)').each do |data|
 			@passingyards = data.content 
 		end

		puts "lalal #{@passingyards}"
	
		self.tellpassyards
	end

end

aaron = Quarterback.new
aaron.name = "Aaron Rodgers"
aaron.position = "QB"
aaron.id = "8439"
aaron.nfl_team = "Green Bay Packers"

aaron.getdata
aaron.getpassingyards

puts aaron.inspect
