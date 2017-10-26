class Idea < ApplicationRecord
  validates  :title,    :body, presence: true

  belongs_to :category, optional: true
  belongs_to :user,     optional: true

  has_many   :idea_images
  has_many   :images, through: :idea_images

  enum       :quality => ['junk', 'whatever', 'ultra cool']
end