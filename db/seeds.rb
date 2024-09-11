# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Like.destroy_all
Comment.destroy_all
Post.destroy_all
Topic.destroy_all
Category.destroy_all
User.destroy_all
puts "database cleared"
# db/seeds.rb

# Seed Users
User.create([
  { user_name: 'jp', bio: 'Coffee Barista', email: 'jp@gmail.com', password: 'password' },
  { user_name: 'sammy', bio: 'Tech enthusiast and blogger.', email: 'samuel@gmail.com', password: 'password' },
  { user_name: 'xhanti', bio: 'Machine learning researcher.', email: 'xhanti@gmail.com', password: 'password' }
])

# Seed Categories
Category.create([
  { title: 'Technology', description: 'All about the latest in tech.', user_id: User.first.id },
  { title: 'AI & Machine Learning', description: 'Discussions on AI advancements.', user_id: User.second.id },
  { title: 'Programming', description: 'Topics on programming languages and frameworks.', user_id: User.third.id }
])

# Seed Topics
Topic.create([
  { title: 'Best programming languages in 2024', description: 'Discussion on the most popular languages.', category_id: Category.find_by(title: 'Programming').id, user_id: User.first.id, by_ai: false },
  { title: 'AI in healthcare', description: 'How AI is transforming healthcare.', category_id: Category.find_by(title: 'AI & Machine Learning').id, user_id: User.second.id, by_ai: false },
  { title: 'Future of tech', description: 'What does the future hold for tech?', category_id: Category.find_by(title: 'Technology').id, user_id: User.third.id, by_ai: true }
])

# Seed Posts
Post.create([
  { topic_id: Topic.first.id, user_id: User.first.id, content: 'I think Rust is going to be big!', by_ai: false },
  { topic_id: Topic.second.id, user_id: User.second.id, content: 'AI will improve diagnostics significantly.', by_ai: false },
  { topic_id: Topic.third.id, user_id: User.third.id, content: 'AI will be central to future tech development.', by_ai: true }
])

# Seed Comments
Comment.create([
  { post_id: Post.first.id, user_id: User.second.id, content: 'I agree! Rust has been gaining a lot of attention.' },
  { post_id: Post.second.id, user_id: User.third.id, content: 'Indeed, especially in medical imaging.' },
  { post_id: Post.third.id, user_id: User.first.id, content: 'It’s inevitable with the current advancements.' }
])

# Seed Likes
Like.create([
  { post_id: Post.first.id, user_id: User.second.id },
  { post_id: Post.second.id, user_id: User.third.id },
  { post_id: Post.third.id, user_id: User.first.id }
])

puts "Seeding completed!"
