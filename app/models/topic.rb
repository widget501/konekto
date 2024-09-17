class Topic < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :posts

  validates :title, presence: true
  validates :description, presence: true
end
