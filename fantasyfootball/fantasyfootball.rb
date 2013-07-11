#Require nokogiri
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
	attr_accessor :position, :stats, :name, :nfl_team, :id, :rushyards

def rushingyards
	player_id = self.id

	espn_url = "http://espn.go.com/nfl/player/_/id/#{player_id}"

	doc = Nokogiri::HTML(open("#{espn_url}"))

	doc.css('tr.oddrow:nth-child(2) td:nth-child(4)').each do |data|
 		self.rushyards = data.content
	end

end


def tellusyards
	newplayers = []
	puts self.inspect
	#players.each do |player|
		if self.position == "QB"
			self.rushingyards
			newplayers << self
			puts newplayers.inspect
			puts "#{self.name} rushed #{self.rushyards} yards"
		else
			newplayers << self
			puts newplayers.inspect
			puts "#{self.name} is not a qb"
		end
	#end
end

end

aaron = FootballPlayer.new
aaron.name = "Aaron Rodgers"
aaron.position = "QB"
aaron.nfl_team = "Green Bay Packers"
aaron.id ="8439"

aaron.tellusyards

