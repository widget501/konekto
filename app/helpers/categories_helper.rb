module CategoriesHelper
  def category_icon(category)
    icons = {
      "Tech" => "fas fa-laptop",
      "Science" => "fa-solid fa-microscope",
      "Travel" => "fas fa-plane",
      "Education" => "fas fa-book",
      "Music" => "fas fa-music",
      "Sports" => "fas fa-volleyball-ball",
      "Food" => "fas fa-utensils",
      "Finance" => "fa-solid fa-coins",
      "Health" => "fa-solid fa-staff-snake",
      "Movies" => "fas fa-film"
    }
    icons[category.title] || "fas fa-question" # Default icon if category not found
  end
end
