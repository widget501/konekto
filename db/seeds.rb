puts "Clearing database..."
Like.destroy_all
Comment.destroy_all
Post.destroy_all
Topic.destroy_all
Category.destroy_all
User.destroy_all

puts "Database cleared"

puts "Seeding database..."
# Create specific users
users = []

users << User.create!(
  user_name: "Xhanti",
  email: "xman@example.com",
  password: "password",
  bio: "Bio for Xhanti"
)

users << User.create!(
  user_name: "JP",
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

# Create 15 additional random users with varied bios
additional_users = [
  { user_name: "tech_guru", email: "tech_guru@example.com", bio: "Always looking for the next big thing in AI." },
  { user_name: "health_fanatic", email: "health_fanatic@example.com", bio: "I love discussing the latest health trends!" },
  { user_name: "music_maven", email: "music_maven@example.com", bio: "Music is the rhythm of my life." },
  { user_name: "movie_buff", email: "movie_buff@example.com", bio: "Seen every movie worth watching. Twice." },
  { user_name: "sporty_jane", email: "sporty_jane@example.com", bio: "Football fanatic and aspiring runner." },
  { user_name: "finance_guru", email: "finance_guru@example.com", bio: "Finance is where strategy meets numbers." },
  { user_name: "food_lover", email: "food_lover@example.com", bio: "Always on the lookout for the best eats in town." },
  { user_name: "travel_bug", email: "travel_bug@example.com", bio: "Travel far, travel often." },
  { user_name: "science_nerd", email: "science_nerd@example.com", bio: "Lover of all things physics and space." },
  { user_name: "edu_expert", email: "edu_expert@example.com", bio: "Committed to transforming education through tech." },
  { user_name: "sammy_sports", email: "sammy_sports@example.com", bio: "Living and breathing all things sports." },
  { user_name: "history_buff", email: "history_buff@example.com", bio: "History is not the past, it's still alive!" },
  { user_name: "chef_master", email: "chef_master@example.com", bio: "Cooking is an art, and I'm its artist." },
  { user_name: "money_maker", email: "money_maker@example.com", bio: "Investing is a game, and I'm here to win." },
  { user_name: "movie_junkie", email: "movie_junkie@example.com", bio: "Binging all day, every day." }
]

additional_users.each do |user_data|
  users << User.create!(
    user_name: user_data[:user_name],
    email: user_data[:email],
    password: "password",
    bio: user_data[:bio]
  )
end

# Predefined categories
categories = ["Education", "Finance", "Food", "Health", "Movies", "Music", "Science", "Sports", "Tech", "Travel"]

# Topics, posts, and comments for each category
categories.each do |category_title|
  puts "Seeding Category #{category_title}"

  category = Category.create!(
    title: category_title,
    description: "#{category_title} related topics",
    user: users.sample
  )

  # Create unique topics for each category
  topics = case category_title
  when "Tech"
    [
      "AI is Taking Over: What Does the Future Hold?",
      "How 5G is Changing Internet Speeds",
      "Best Programming Languages to Learn in 2024",
      "Blockchain Beyond Cryptocurrency",
      "Cybersecurity Tips Everyone Should Know"
    ]
  when "Health"
    [
      "The Importance of Mental Health in the Workplace",
      "Is Intermittent Fasting Good for You?",
      "Top 5 Superfoods You Should Add to Your Diet",
      "Home Workouts That Actually Work",
      "The Dangers of Sitting Too Much"
    ]
  when "Education"
    [
      "Online Learning vs Traditional: Which is Better?",
      "Are Coding Bootcamps Worth It?",
      "How to Improve Access to Quality Education",
      "The Future of STEM Education",
      "How VR is Being Used in Classrooms"
    ]
  when "Science"
    [
      "The Possibility of Life on Mars",
      "How Quantum Computing Could Revolutionize Science",
      "Understanding Black Holes: A Deep Dive",
      "The Science Behind Renewable Energy",
      "The Role of Genetics in Modern Medicine"
    ]
  when "Travel"
    [
      "Top 10 Underrated Travel Destinations in 2024",
      "Solo Travel: Is It Worth the Risk?",
      "How to Travel on a Budget",
      "The Best Places to Visit Post-COVID",
      "How Technology is Shaping the Travel Industry"
    ]
  when "Music"
    [
      "The Vinyl Revival: Why It's Popular Again",
      "How Streaming Services Have Changed Music Discovery",
      "The Most Influential Albums of the 2000s",
      "Music Genres on the Rise in 2024",
      "How TikTok is Influencing the Music Industry"
    ]
  when "Sports"
    [
      "The Evolution of Football Analytics",
      "How Athletes Stay Fit Off-Season",
      "What Makes a Great Coach?",
      "The Rise of Esports in 2024",
      "How Technology is Improving Athlete Performance"
    ]
  when "Movies"
    [
      "Why Remakes and Reboots Dominate Hollywood",
      "The Best Indie Films You Might Have Missed",
      "How Streaming Has Changed Movie Theaters",
      "Top 10 Movie Franchises of All Time",
      "The Role of Directors in Shaping Film"
    ]
  when "Food"
    [
      "Why Everyone is Talking About Plant-Based Diets",
      "Best Street Foods Around the World",
      "How to Make the Perfect Pizza",
      "Food Trends to Watch Out for in 2024",
      "The Secrets Behind Great BBQ"
    ]
  when "Finance"
    [
      "How to Invest in a Volatile Market",
      "Cryptocurrency: Is It Too Late to Invest?",
      "Saving for Retirement in Your 20s",
      "How the Stock Market Has Changed in 2024",
      "Understanding Real Estate Investment"
    ]
  else
    ["General Discussion on #{category_title}"]
  end

  # Create topics for each category
  topics.each do |topic_title|
    topic = Topic.create!(
      title: topic_title,
      description: "Discussion about #{topic_title}",
      category: category,
      user: users.sample,
      by_ai: [true, false].sample
    )

    # Create 10 unique posts per topic
    unique_posts = [
      "I think AI is going to change how we live. But, there’s a lot of fear about job loss due to automation. What’s your take on this?",
      "5G internet is incredibly fast, but I’m concerned about the health implications of such a dense network. Any thoughts?",
      "I just started learning Python, and it's pretty beginner-friendly. What’s the best programming language for a new coder in 2024?",
      "Blockchain is still often misunderstood as just cryptocurrency tech. It has so many other applications that we need to explore.",
      "Cybersecurity is a growing concern for everyone. What are some simple ways to keep yourself safe online without needing advanced knowledge?"
    ]

    # Expand unique_posts per category
    15.times do |i|
      post_content = case category_title
      when "Tech"
        unique_posts[i % unique_posts.size]
      when "Health"
        [
          "Mental health awareness is improving, but there’s still so much stigma in workplaces. What’s being done to address this?",
          "Intermittent fasting has helped me lose weight, but is it sustainable in the long term?",
          "Superfoods are trendy, but I think it’s more about eating balanced meals. What do you think?",
          "I’ve been working out at home and actually seeing great results. No need for expensive gyms!",
          "Sitting too long can seriously affect your health. I make sure to stand up and stretch every hour!"
        ][i % 5]
      when "Education"
        [
          "I’ve tried both online and traditional learning, and both have their pros and cons. How do you think they compare?",
          "Access to quality education is still an issue. How can technology help fix this gap?",
          "STEM education is the future, but there’s still a gender gap. How do we get more young girls interested in STEM?",
          "Coding bootcamps are all the rage, but do they really prepare students for real-world jobs?",
          "Virtual reality in education is cool, but do you think it’s a gimmick or a game-changer?"
        ][i % 5]
      when "Science"
        [
          "Climate change is a myth created by scientists for funding.",
          "Vaccines should be a personal choice, not a mandate.",
          "Space exploration is a waste of resources we could use on Earth.",
          "GMOs are harmful and shouldn't be allowed in our food supply.",
          "Evolution is just a theory and shouldn’t be taught in schools."
        ][i % 5]
      when "Travel"
        [
          "Tourism is destroying local cultures and ecosystems.",
          "Air travel should be heavily taxed due to its carbon footprint.",
          "Traveling to third-world countries is exploitative.",
          "Cruises are terrible for the environment and should be banned.",
          "People should stay in their own countries instead of moving around."
        ][i % 5]
      when "Music"
        [
          "Auto-tune has ruined the quality of modern music.",
          "Streaming services are killing the music industry.",
          "Classic rock is overrated and should be retired.",
          "Most pop music today lacks any artistic value.",
          "Rap music promotes harmful stereotypes and violence."
        ][i % 5]
      when "Sports"
        [
          "Professional athletes are overpaid for playing games.",
          "Football causes too many injuries and should be banned.",
          "Olympics are a waste of resources and should be discontinued.",
          "Esports aren’t real sports and don’t deserve the same recognition.",
          "Sports teams exploit fans with overpriced tickets and merchandise."
        ][i % 5]
      when "Movies"
        [
          "Superhero movies have ruined the film industry with their lack of creativity.",
          "Hollywood is too focused on pushing political agendas instead of storytelling.",
          "Remakes are lazy and disrespectful to the original films.",
          "Independent films are superior to Hollywood blockbusters.",
          "Movies should not include political or social messages."
        ][i % 5]
      when "Food"
        [
          "Veganism is unnatural and unhealthy in the long run.",
          "Organic food is a scam; there's no real difference from regular food.",
          "Processed foods are just as good as fresh foods if you know how to balance.",
          "Eating meat is essential for a healthy diet, plants can't provide all nutrients.",
          "Fast food should be banned to prevent obesity."
        ][i % 5]
      when "Finance"
        [
          "Cryptocurrency is a bubble and will eventually crash.",
          "The stock market is rigged for the rich and not for everyday people.",
          "Universal basic income would ruin people’s work ethic.",
          "Taxes should be drastically increased for the wealthy.",
          "Debt is not necessarily a bad thing; it’s a tool for growth."
        ][i % 5]
      # # Continue for each category
      # when  "Music", "Sports", "Movies", "Food", "Finance"
      #   topics = [
      #     # Add unique posts for each of these categories
      #   ]
      # else
      #   "General discussion on #{topic_title}"
      end

      post = Post.create!(
        content: post_content,
        topic: topic,
        user: users.sample,
        by_ai: [true, false].sample
      )

      # Create comments for each post
      15.times do
        comment_content = [
          "I completely agree with you.",
          "This is so insightful!",
          "Wow, I hadn't thought of it that way before.",
          "Can you share more about this?",
          "I have a different opinion, but I see your point.",
          "Wow, this is so inspiring! Thanks for sharing 😊.",
          "I love your perspective on this topic, really insightful!",
          "This made my day, thank you for posting it! 🌟",
          "You always share such valuable content, keep it up!",
          "Amazing! I never thought about it that way, thanks for opening my eyes.",
          "Such a great post! I feel like I learned something new today.",
          "Your posts always bring a smile to my face! 😊",
          "This is exactly what I needed to see today, thank you!",
          "You have such a positive energy, it really shines through in your posts!",
          "Thanks for putting this out there, it's incredibly thoughtful and helpful!"
          ].sample

        Comment.create!(
          content: comment_content,
          post: post,
          user: users.sample
        )
      end

      # Randomly assign likes to posts
      users.sample(rand(1..15)).each do |user|
        Like.create!(user: user, post: post)
      end
    end
  end
end

# Print the counts of each model after seeding
puts "Seeding completed successfully!"
puts "Users: #{User.count}"
puts "Categories: #{Category.count}"
puts "Topics: #{Topic.count}"
puts "Posts: #{Post.count}"
puts "Comments: #{Comment.count}"
puts "Likes: #{Like.count}"
