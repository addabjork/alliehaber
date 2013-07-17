require 'nokogiri'
require 'open-uri'



class FootballPlayer

	attr_accessor :position, :stats, :name, :nfl_team, :id, :url
	
	def getdata
		espn_url = self.url
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

class FootballTeam
	attr_accessor :players, :rosterurl, :name
			
	def getplayers
		team_url = "http://espn.go.com/nfl/team/roster/_/name/dal/dallas-cowboys"
		@doc = Nokogiri::HTML(open("#{team_url}"))
		
		
		@players = []
		
		@doc.css('.mod-content tr td:nth-child(2)').each do |data|
		#puts data
			playerurl = data.css("a")[0]["href"]
			playername = data.content
			
			if playername != "NAME"
				newfootballplayer = FootballPlayer.new
				newfootballplayer.name = playername
				newfootballplayer.url = playerurl
				newfootballplayer.getdata
				puts newfootballplayer.name
				puts newfootballplayer.position
				puts newfootballplayer.nfl_team
				@players << newfootballplayer
			end
			
		end
end 

end

class Application
	attr_accessor :teams
	def getallteams
	
			@teams = []
			
		league_url = "http://espn.go.com/nfl/teams"
		@doc = Nokogiri::HTML(open("#{league_url}"))
		@doc.css('.first .logo-nfl-medium-19 span:nth-child(2)').each do |data|
			puts data
			rosterurl = data.css("a")[2]["href"]
			newurl = "http://espn.go.com" + rosterurl
			
				newfootballteam = FootballTeam.new
				newfootballteam.url = newrurl
				newfootballteam.getplayers
				@teams << newfootballteam
			
			
		end
	end
end


fantasyfootball = Application.new
fantasyfootball.getallteams
puts fantasyfootball.teams	