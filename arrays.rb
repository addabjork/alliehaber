blog_posts = [
		["My blog post title", "content", "Josh", "June 26, 2013"],
		["My second blog post title", "content2", "Justin", 
			"June 25, 2013"],
			["My third blog post title", "content3", "Adda", "June 24, 2013"]
]
blog_posts.each do |x|
	puts x
end

blog_post_2 = blog_posts[1]

puts "this is blog post 2: #{blog_post_2}"

title = blog_post_2[0]

puts title

blog_post_3 = blog_posts[2]
puts "this is blog post 3: #{blog_post_3}"
title = blog_post_3[0]
puts title