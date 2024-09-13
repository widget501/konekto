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
  { user_name: 'jp', bio: 'Coffee Barista', email: 'jp@jp.jp', password: 'jp@jp.jp' },
  { user_name: 'sammy', bio: 'Tech enthusiast and blogger.', email: 'sam@sam.sam', password: 'sam@sam.sam' },
  { user_name: 'xhanti', bio: 'Machine learning researcher.', email: 'xhanti@gmail.com', password: 'password' }
  ])

# Seed Categories
Category.create([
  { title: 'Music', description: 'All about the latest in music.', user_id: User.first.id },
  { title: 'Movies', description: 'Discussions on the latest movies.', user_id: User.second.id },
  { title: 'Sports', description: 'All about the latest in sports.', user_id: User.third.id },
  { title: 'Technology', description: 'All about the latest in tech.', user_id: User.first.id },
  { title: 'AI & Machine Learning', description: 'Discussions on AI advancements.', user_id: User.second.id },
  { title: 'Programming', description: 'Topics on programming languages and frameworks.', user_id: User.third.id },
  { title: 'Books', description: 'Discussions on the latest books.', user_id: User.first.id },
  { title: 'Food', description: 'All about the latest in food.', user_id: User.second.id },
  { title: 'Travel', description: 'Discussions on the latest travel destinations.', user_id: User.third.id }
  ])

# Seed Topics
Topic.create([
  { title: 'Best programming languages in 2024', description: 'Discussion on the most popular languages.', category_id: Category.find_by(title: 'Programming').id, user_id: User.first.id, by_ai: false },
  { title: 'AI in healthcare', description: 'How AI is transforming healthcare.', category_id: Category.find_by(title: 'AI & Machine Learning').id, user_id: User.second.id, by_ai: false },
  { title: 'Future of tech', description: 'What does the future hold for tech?', category_id: Category.find_by(title: 'Technology').id, user_id: User.third.id, by_ai: true },
  { title: 'Best music of 2024', description: 'Discussion on the best music of the year.', category_id: Category.find_by(title: 'Music').id, user_id: User.first.id, by_ai: false },
  { title: 'Best movies of 2024', description: 'Discussion on the best movies of the year.', category_id: Category.find_by(title: 'Movies').id, user_id: User.second.id, by_ai: false },
  { title: 'Best sports of 2024', description: 'Discussion on the best sports of the year.', category_id: Category.find_by(title: 'Sports').id, user_id: User.third.id, by_ai: true },
  { title: 'Best books of 2024', description: 'Discussion on the best books of the year.', category_id: Category.find_by(title: 'Books').id, user_id: User.first.id, by_ai: false },
  { title: 'Best food of 2024', description: 'Discussion on the best food of the year.', category_id: Category.find_by(title: 'Food').id, user_id: User.second.id, by_ai: false },
  { title: 'Best travel of 2024', description: 'Discussion on the best travel of the year.', category_id: Category.find_by(title: 'Travel').id, user_id: User.third.id, by_ai: true }
  ])

# Seed Posts
Post.create([
  { topic_id: Topic.first.id, user_id: User.first.id, content: 'I think Rust is going to be big!', by_ai: false },
  { topic_id: Topic.second.id, user_id: User.second.id, content: 'AI will improve diagnostics significantly.', by_ai: false },
  { topic_id: Topic.third.id, user_id: User.third.id, content: 'AI will be central to future tech development.', by_ai: true },
  { topic_id: Topic.first.id, user_id: User.first.id, content: 'I think Microsoft will release a new version.', by_ai: false },
  { topic_id: Topic.second.id, user_id: User.second.id, content: 'I think the next big movie will be a sci-fi.', by_ai: false },
  { topic_id: Topic.third.id, user_id: User.third.id, content: 'I think the next big sport will be drone racing.', by_ai: true },
  { topic_id: Topic.first.id, user_id: User.first.id, content: 'I think the next big book will be a thriller.', by_ai: false },
  { topic_id: Topic.second.id, user_id: User.second.id, content: 'I think the next big food trend will be plant-based.', by_ai: false },
  { topic_id: Topic.third.id, user_id: User.third.id, content: 'I think the next big travel destination will be Antarctica.', by_ai: true }
  ])

# Seed Comments
Comment.create([
  { post_id: Post.first.id, user_id: User.second.id, content: 'I agree! Rust has been gaining a lot of attention.' },
  { post_id: Post.second.id, user_id: User.third.id, content: 'Indeed, especially in medical imaging.' },
  { post_id: Post.third.id, user_id: User.first.id, content: 'It’s inevitable with the current advancements.' },
  { post_id: Post.first.id, user_id: User.third.id, content: 'I think Adele will release a new album.' },
  { post_id: Post.second.id, user_id: User.first.id, content: 'I think the next big movie will be a sci-fi.' },
  { post_id: Post.third.id, user_id: User.second.id, content: 'I think the next big sport will be drone racing.' },
  { post_id: Post.first.id, user_id: User.third.id, content: 'I think the next big book will be a thriller.' },
  { post_id: Post.second.id, user_id: User.third.id, content: 'I think the next big food trend will be plant-based.' },
  { post_id: Post.third.id, user_id: User.first.id, content: 'I think the next big travel destination will be Antarctica.' }
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
