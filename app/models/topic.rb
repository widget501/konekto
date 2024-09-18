class Topic < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :posts

  validates :title, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [ :description, :title ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  multisearchable against: [:title, :description]
end
