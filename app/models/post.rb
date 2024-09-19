class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :likers, through: :likes, source: :user

  include PgSearch::Model
  pg_search_scope :search_by_content,
    against: [ :content ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

  multisearchable against: [:content]
end
