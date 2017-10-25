class Idea < ApplicationRecord
  validates  :title, :body, presence: true
  belongs_to :category, optional: true

  has_many :idea_images
  has_many :images, through: :idea_images
end