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
	attr_accessor :players, :url, :name
			
	def getplayers
		team_url = "http://espn.go.com/nfl/team/roster/_/name/nyg/new-york-giants"
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
				#puts newfootballplayer.name
				#puts newfootballplayer.position
				#puts newfootballplayer.nfl_team
				@players << newfootballplayer
			end
			
		end
end 

end

class Application
	attr_accessor :teams
	def getallteams
	
			@teams = []
			@@teamlinks = [ "http://espn.go.com/nfl/team/roster/_/name/nyg/new-york-giants", "http://espn.go.com/nfl/team/roster/_/name/dal/dallas-cowboys", 
				"http://espn.go.com/nfl/team/_/name/phi/philadelphia-eagles", "http://espn.go.com/nfl/team/roster/_/name/wsh/washington-redskins", 
				"http://espn.go.com/nfl/team/roster/_/name/buf/buffalo-bills", "http://espn.go.com/nfl/team/roster/_/name/mia/miami-dolphins", 
				"http://espn.go.com/nfl/team/roster/_/name/ne/new-england-patriots", "http://espn.go.com/nfl/team/roster/_/name/nyj/new-york-jets", 
				"http://espn.go.com/nfl/team/roster/_/name/ari/arizona-cardinals", "http://espn.go.com/nfl/team/roster/_/name/sf/san-francisco-49ers", 
				"http://espn.go.com/nfl/team/roster/_/name/sea/seattle-seahawks", "http://espn.go.com/nfl/team/roster/_/name/stl/st-louis-rams", 
				"http://espn.go.com/nfl/team/roster/_/name/den/denver-broncos", "http://espn.go.com/nfl/team/roster/_/name/kc/kansas-city-chiefs", 
				"http://espn.go.com/nfl/team/roster/_/name/oak/oakland-raiders", "http://espn.go.com/nfl/team/roster/_/name/sd/san-diego-chargers", 
				"http://espn.go.com/nfl/team/roster/_/name/chi/chicago-bears", "http://espn.go.com/nfl/team/roster/_/name/det/detroit-lions", 
				"http://espn.go.com/nfl/team/roster/_/name/gb/green-bay-packers", "http://espn.go.com/nfl/team/roster/_/name/min/minnesota-vikings", 
				"http://espn.go.com/nfl/team/roster/_/name/bal/baltimore-ravens", "http://espn.go.com/nfl/team/roster/_/name/cin/cincinnati-bengals", 
				"http://espn.go.com/nfl/team/roster/_/name/cle/cleveland-browns", "http://espn.go.com/nfl/team/roster/_/name/pit/pittsburgh-steelers",
				"http://espn.go.com/nfl/team/roster/_/name/atl/atlanta-falcons", "http://espn.go.com/nfl/team/_/name/car/carolina-panthers", 
				"http://espn.go.com/nfl/team/roster/_/name/no/new-orleans-saints", "http://espn.go.com/nfl/team/roster/_/name/tb/tampa-bay-buccaneers", 
				"http://espn.go.com/nfl/team/roster/_/name/hou/houston-texans", "http://espn.go.com/nfl/team/roster/_/name/ind/indianapolis-colts", 
				"http://espn.go.com/nfl/team/roster/_/name/jac/jacksonville-jaguars", "http://espn.go.com/nfl/team/roster/_/name/ten/tennessee-titans" ]
			
			@@teamlinks.each do |newurl|


				newfootballteam = FootballTeam.new
				newfootballteam.url = newurl
				newfootballteam.getplayers
				@teams << newfootballteam
			
			
		end
	end
end


fantasyfootball = Application.new
fantasyfootball.getallteams
@teams.each do |team|
	puts team.players.length
end
#footballteam = FootballTeam.new
#footballteam.getplayers
#puts footballteam.name