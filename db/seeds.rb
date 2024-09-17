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
# db/seeds.rb

# db/seeds.rb

# Create 15 users
users = []
15.times do |i|
  users << User.create!(
    user_name: "user_#{i+1}",
    email: "user_#{i+1}@example.com",
    password: "password",
    bio: "Bio for user_#{i+1}"
  )
end

users << User.create!(
  user_name: "xman",
  email: "xman@example.com",
  password: "password",
  bio: "Bio for Xhanti"
)

users << User.create!(
  user_name: "jp",
  email: "jp@example.com",
  password: "password",
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

  # Create 20 topics per category
  5.times do |topic_index|
    topic = Topic.create!(
      title: "Topic #{topic_index+1} in #{category.title}",
      description: "Description for topic #{topic_index+1} in #{category.title}",
      category: category,
      user: users.sample,
      by_ai: [true, false].sample
    )
    puts "Topic created"

    # Create 50 posts per topic
    5.times do |post_index|
      post = Post.create!(
        content: "Content of post #{post_index+1} in #{topic.title}",
        topic: topic,
        user: users.sample,  # Randomly assign a user as the author
        by_ai: [true, false].sample
      )
      puts "Post created"

      # Create 10 comments per post
      5.times do |comment_index|
        Comment.create!(
          content: "Comment #{comment_index+1} on post #{post.content.truncate(30)}",
          post: post,
          user: users.sample # Randomly assign a user to comment
        )
      end

      # Randomly assign between 1 and 15 users to like the post
      users.sample(rand(1..15)).each do |user|
        Like.create!(user: user, post: post)
      end

      puts "commented and liked"
    end
  end
end

puts "Seeding completed successfully!"
