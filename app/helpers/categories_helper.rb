module CategoriesHelper
  def category_icon(category)
    icons = {
      "Technology" => "fas fa-laptop",
      "Movies" => "fa-solid fa-video",
      "Travel" => "fas fa-plane",
      "Books" => "fas fa-book",
      "Music" => "fas fa-music",
      "Sports" => "fas fa-volleyball-ball",
      "Food" => "fas fa-utensils",
      "Programming" => "fas fa-laptop-code",
      "AI & Machine Learning" => "fas fa-robot",
    }
    icons[category.title] || "fas fa-question" # Default icon if category not found
  end
end
