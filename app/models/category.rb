class Category < ApplicationRecord
  belongs_to :user
  has_many :topics
  validates :title, uniqueness: true
end
