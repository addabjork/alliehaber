# every time someone tweets something, you get a message
# gem from twitter-> "twitter"
# pony- gem for email
# how to get data from twitter
require "twitter"
require "pony"

# twitter = Net::HTTP.start('twitter.com')


Twitter.configure do |config|
  config.consumer_key = "iYXDkmpfCyT6QZp7LACotA"
  config.consumer_secret = "bFErURhhhi9jCYdar9WlGrLic8lFMakrsRZjesJAdqE"
  config.oauth_token = "78766228-FulLq2OVCn446ATNXPcpwLWlFQLz0yFV5rRqXLE0x"
  config.oauth_token_secret = "IIQz4iuTy6d0vbgRdWrkZpkeQi8kdNg0pmdhOI0ui9Y"
end

#puts "Input your email address"
#email_address = gets.chomp

puts "Which account would u you like to get emails from, no spaces."
account = gets.downcase
#search for most recent tweet
timeline = Twitter.user_timeline(account)

puts timeline.length

firsttweetid = timeline[0].id
#email the most recent tweet
puts firsttweetid

timeline = Twitter.user_timeline(account)

x = 1

secondtweetid = timeline[0].id
puts secondtweetid
while x == 1 
#if the most recent tweet is not the same as the most recent when we checked b4, send it, otherwise dont send
if firsttweetid != secondtweetid
     tweetstatus = secondtweetid.text
     Pony.mail({
          :to => email_address,
          :via => :smtp,
          :subject => "#{account} tweeted",
          :body => tweetstatus,
        :address              => 'smtp.gmail.com',
          :port                 => '587',
          :enable_starttls_auto => true,
          :user_name            => 'allieshaber',
          :password             => 'ahaber1315',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
          :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
          })
end
sleep 10
end