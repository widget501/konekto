# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

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

# Create 15 users with specific Faker details
users = []
15.times do |i|
  users << User.create!(
    user_name: Faker::Internet.unique.username(specifier: 5..10),
    email: Faker::Internet.unique.email,
    password: "password",
    bio: Faker::Quote.famous_last_words # More interesting bios
  )
end

# Specific users
users << User.create!(
  user_name: "xman",
  email: "xman@example.com",
  password: "password",
  bio: "Bio for Xhanti"
)

users << User.create!(
  user_name: "jp",
  email: "jp@example.com",
  password: "jp@example.com",
  bio: "Bio for JP"
)

users << User.create!(
  user_name: "Sam",
  email: "sam@example.com",
  password: "password",
  bio: "Bio for Sam"
)

# Example categories
categories = ["Tech", "Health", "Education", "Science", "Travel", "Music", "Sports", "Movies", "Food", "Finance"]

# Create categories, topics, posts, comments, and likes
categories.each do |category_title|
  puts "Seeding Category"
  category = Category.create!(
    title: category_title,
    description: "#{category_title} related topics",
    user: users.sample
  )

  # Create 5 topics per category based on the category title
  5.times do |topic_index|
    topic_title = case category_title
    when "Tech" then Faker::Computer.platform
    when "Health" then Faker::Cannabis.strain # Specific to healthcare terms
    when "Education" then Faker::University.name
    when "Science" then Faker::Science.element
    when "Travel" then Faker::Mountain.name
    when "Music" then Faker::Music.album
    when "Sports" then Faker::Sports::Football.team
    when "Movies" then Faker::Movie.title
    when "Food" then Faker::Food.dish
    when "Finance" then Faker::Bank.name
    else Faker::Lorem.sentence # Fallback option
    end

    topic = Topic.create!(
      title: "#{topic_title} in #{category.title}",
      description: "Discussion about #{topic_title} in the context of #{category.title}.",
      category: category,
      user: users.sample,
      by_ai: [true, false].sample
    )
    puts "Topic created"

    # Create 5 posts per topic based on category title
    5.times do |post_index|
      post_content = case category_title
      when "Tech" then Faker::ProgrammingLanguage.name + " is evolving rapidly."
      when "Health" then Faker::Cannabis.strain + " is a common treatment."
      when "Education" then "Education at " + Faker::University.name + " is top-notch."
      when "Science" then Faker::Science.scientist + " discovered new data on " + Faker::Science.element
      when "Travel" then "Exploring the mountains of " + Faker::Mountain.name + " was breathtaking."
      when "Music" then "The latest album from " + Faker::Music.band + " is a must-listen."
      when "Sports" then "The team " + Faker::Sports::Football.team + " won the championship."
      when "Movies" then "Watching " + Faker::Movie.title + " was an amazing experience."
      when "Food" then Faker::Food.dish + " is my favorite dish of all time!"
      when "Finance" then "Managing finances with " + Faker::Bank.name + " services is seamless."
      else "Content of post #{post_index+1} in #{topic.title}."
      end

      post = Post.create!(
        content: post_content,
        topic: topic,
        user: users.sample,
        by_ai: [true, false].sample
      )
      puts "Post created"

      # Create 5 comments per post based on random quotes matching the category
      5.times do |comment_index|
        comment_content = case category_title
        when "Tech" then Faker::Quote.famous_last_words
        when "Health" then Faker::TvShows::DrWho.quote
        when "Education" then Faker::Quote.matz # A famous Ruby creator quote
        when "Science" then Faker::TvShows::BigBangTheory.quote
        when "Travel" then Faker::Movies::HarryPotter.quote
        when "Music" then Faker::Music::PearlJam.song
        when "Sports" then Faker::TvShows::GameOfThrones.quote
        when "Movies" then Faker::Movies::StarWars.quote
        when "Food" then Faker::TvShows::Friends.quote # Friends had many food-related scenes
        when "Finance" then Faker::Quotes::Shakespeare.king_richard_iii_quote
        else "Comment #{comment_index+1} on post #{post.content.truncate(30)}"
        end

        Comment.create!(
          content: comment_content,
          post: post,
          user: users.sample
        )
      end

      # Randomly assign between 1 and 15 users to like the post
      users.sample(rand(1..15)).each do |user|
        Like.create!(user: user, post: post)
      end

      puts "Commented and liked"
    end
  end
end

puts "Seeding completed successfully!"
