class Category < ApplicationRecord
  belongs_to :user
  has_many :topics
  validates :title, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  multisearchable against: [:title]
end
