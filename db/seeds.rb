# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clearing database..."
Like.destroy_all
Comment.destroy_all
Post.destroy_all
Topic.destroy_all
Category.destroy_all
User.destroy_all

puts "database cleared"

puts "Seeding database..."
# db/seeds.rb

# Seed Users
User.create([
  { user_name: "Joe Braby", bio: "Coffee Barista", email: "jp@jp.com", password: "jp@jp.com" },
  { user_name: "Sammy", bio: "Tech enthusiast and blogger.", email: "sam@sam.sam", password: "sam@sam.sam" },
  { user_name: "Xhanti", bio: "Nuclear Machine learning guru.", email: "xhanti@gmail.com", password: "password" }
  ])

# Seed Categories
Category.create([
  { title: "Music", description: "All about the latest Music industry news.", user_id: User.first.id },
  { title: "Movies", description: "The latest movies on the circuit.", user_id: User.second.id },
  { title: "Sports", description: "What is new in sport...", user_id: User.third.id },
  { title: "Books", description: "Discussions on the latest top-selling books.", user_id: User.first.id },
  { title: "Food", description: "Food! What the descerning foodie wants to know", user_id: User.second.id },
  { title: "Travel", description: "Pack! Lets go! The latest on exotic travel destinations", user_id: User.third.id },
  { title: "Programming", description: "New developments in programming languages and frameworks.", user_id: User.third.id },
  { title: "AI & Machine Learning", description: "Discussions on AI & ML advancements.", user_id: User.second.id },
  { title: "Technology", description: "Latest trends in the technology sector", user_id: User.first.id }
  ])

# Seed Topics
Topic.create([
  { title: "Popular music of 2024", description: "Listen to the best music of the year.", category_id: Category.find_by(title: "Music").id, user_id: User.first.id, by_ai: false },
  { title: "Goldies of the 40s - music of a forgotten era", description: "Music dating from mid and post WWII", category_id: Category.find_by(title: "Music").id, user_id: User.first.id, by_ai: false },
  { title: "Top movies of 2024", description: "Watch the best movies of the year.", category_id: Category.find_by(title: "Movies").id, user_id: User.second.id, by_ai: false },
  { title: "Sport in 2024", description: "Reaad all about the world of sports this year.", category_id: Category.find_by(title: "Sports").id, user_id: User.third.id, by_ai: true },
  { title: "Best books trending 2024", description: "Find your next read. A discussion on the best books of the year.", category_id: Category.find_by(title: "Books").id, user_id: User.first.id, by_ai: false },
  { title: "Food of the world, 2024", description: "All about new dishes and the rantings of foodies", category_id: Category.find_by(title: "Food").id, user_id: User.second.id, by_ai: false },
  { title: "Exotic travel destinations", description: "Everything you want to know about trending exotic travel destinations.", category_id: Category.find_by(title: "Travel").id, user_id: User.third.id, by_ai: true },
  { title: "Most used programming languages in 2024", description: "Discussion on the latest and most popular languages.", category_id: Category.find_by(title: "Programming").id, user_id: User.first.id, by_ai: false },
  { title: "AI in aviation", description: "How AI is making the skies safer", category_id: Category.find_by(title: "AI & Machine Learning").id, user_id: User.second.id, by_ai: false },
  { title: "AI in healthcare", description: "Your health transformed by AI", category_id: Category.find_by(title: "AI & Machine Learning").id, user_id: User.second.id, by_ai: false },
  { title: "AI in agriculture", description: "AI is transforming the agricultural landscape.", category_id: Category.find_by(title: "AI & Machine Learning").id, user_id: User.second.id, by_ai: false },
  { title: "Future of tech", description: "What does the future hold for tech?", category_id: Category.find_by(title: "Technology").id, user_id: User.third.id, by_ai: true }
  ])

# Seed Posts
Post.create([
  { topic_id: Topic.first.id, user_id: User.first.id, content: "The latest music of Cuba Picket Fence is EPIC!", by_ai: false },
  { topic_id: Topic.second.id, user_id: User.second.id, content: "Jazz: Bebop, a fast-paced and complex subgenre of jazz, emerged in the late 1940s, revolutionizing the genre with its innovative harmonies and rhythms. ", by_ai: false },
  { topic_id: Topic.third.id, user_id: User.third.id, content: "AI will be central to future movie production.", by_ai: true },
  { topic_id: Topic.first.id, user_id: User.first.id, content: "Pink will release a new album.", by_ai: false },
  { topic_id: Topic.second.id, user_id: User.second.id, content: "Bands like Glenn Miller, Tommy Dorsey, and Duke Ellington became household names.", by_ai: false },
  { topic_id: Topic.third.id, user_id: User.third.id, content: "Star Wars ... I want more Star Wars!", by_ai: true },
  { topic_id: Topic.first.id, user_id: User.first.id, content: "Joe Satriani - Surfing with the Alien is my best album find of all time.", by_ai: false },
  { topic_id: Topic.second.id, user_id: User.second.id, content: "The music of the 1940s reflected the spirit of the times, providing a soundtrack for both celebration and hardship. Its legacy continues to influence popular music today", by_ai: false },
  { topic_id: Topic.third.id, user_id: User.third.id, content: "The movie on Antarctica can spark the next exotic travel destination to this continent.", by_ai: true }
  ])

# Seed Comments
Comment.create([
  { post_id: Post.first.id, user_id: User.second.id, content: "I agree! Cuba Epic has been gaining a lot of attention." },
  { post_id: Post.second.id, user_id: User.third.id, content: "Artists like Charlie Parker and Dizzy Gillespie were pioneers of this style." },
  { post_id: Post.third.id, user_id: User.first.id, content: "It is inevitable with the current advancements." },
  { post_id: Post.first.id, user_id: User.third.id, content: "Charlie Parker ios my favourite!!!" },
  { post_id: Post.second.id, user_id: User.first.id, content: "The 1940s also saw the rise of crooners, such as Frank Sinatra and Bing Crosby, whose smooth vocals and romantic ballads captured the hearts of millions." },
  { post_id: Post.third.id, user_id: User.second.id, content: "The next big sport will be AI-driven F1 racing.  This will truly give the best car manufacturer the edge" },
  { post_id: Post.first.id, user_id: User.third.id, content: "Cuba Picket Fence has just signed a contract to produce a soundtract to a movie planned later this year" },
  { post_id: Post.second.id, user_id: User.third.id, content: "This genre gained popularity, with artists like Hank Williams and Ernest Tubb telling stories of rural life through their music." },
  { post_id: Post.third.id, user_id: User.first.id, content: "Antarctica... whoop whoop!" }
  ])

# Seed Likes
Like.create([
  { post_id: Post.first.id, user_id: User.second.id },
  { post_id: Post.second.id, user_id: User.third.id },
  { post_id: Post.third.id, user_id: User.first.id },
  { post_id: Post.first.id, user_id: User.third.id },
  { post_id: Post.second.id, user_id: User.first.id },
  { post_id: Post.third.id, user_id: User.second.id }
  ])

puts "Seeding completed!"
