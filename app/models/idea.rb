class Idea < ApplicationRecord
  validates :title, :body, presence: true

end
