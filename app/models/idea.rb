class Idea < ApplicationRecord
  validates  :title, :body, presence: true
  belongs_to :category, optional: true
end
