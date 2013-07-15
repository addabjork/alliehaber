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

	def getid
		player_name = self.name
		id_url = "http://search.espn.go.com/#{self.name}/"
		puts id_url
		@doc = Nokogiri::HTML(open("#{id_url}"))
		@doc.css('.span-5 .mod-smart-card h3 a[href]').each do |data|
			@id = data.content.split("=")
			puts @id
			break
		end
	end	
	
	def getdata
		players_id = self.id
		espn_url = "http://espn.go.com/nfl/player/_/id/#{self.id}"
		@doc = Nokogiri::HTML(open("#{espn_url}"))

		@doc.css('.mod-content h1').each do |data|
 			@name = data.content
 		end

		@doc.css('.general-info .first').each do |data|
 			text = data.content.split(" ")
 			@position = text[1]
 		end

		@doc.css('.general-info .last a').each do |data|
 			@nfl_team = data.content
 		end

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

class Runningback < FootballPlayer
	def tellrushyards
		role = self.position
		puts role
			if role == "RB"
				puts "#{self.name} has #{@rushingyards} rushing yards"
			else
				puts "not a running back"
			end
	end
	def getrushyards
		self.getdata

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(3)').each do |data|
 			@rushingyards = data.content 
 		end

		puts "lalal #{@rushingyards}"
	
		self.tellrushyards
	end

	def tellreceivingyardsrb
		role = self.position
		puts role
			if role == "RB"
				puts "#{self.name} has #{@receivingyardsrb} receiving yards"
			else
				puts "not a running"
			end
	end

	def getreceivingyardsrb
		self.getdata

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(9)').each do |data|
 			@receivingyardsrb = data.content 
 		end

			puts "lalal #{@receivingyardsrb}"
		
			self.tellreceivingyardsrb
	end
end

class Receiver < FootballPlayer
	def tellreceivingyardswr
		role = self.position
		puts role
			if role == "WR"
				puts "#{self.name} has #{@receivingyardswr} receiving yards"
			else
				puts "not a receiver"
			end
end

	def getreceivingyardswr
		self.getdata

		@doc.css('tr.oddrow:nth-child(2) td:nth-child(4)').each do |data|
 			@receivingyardswr = data.content 
 		end

			puts "lalal #{@receivingyardswr}"
	
			self.tellreceivingyardswr
	end	
end

aaron = Quarterback.new
aaron.name = "aaron-rodgers"

aaron.getid

puts aaron.inspect
puts aaron.position
