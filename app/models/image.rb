class Image < ApplicationRecord
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_attached_file :image, :styles => {:thumb  => "100x100#",
                                        :small  => "150x150>",
                                        :medium => "200x200" }

  validates :url, presence: true
  has_many  :idea_images
  has_many  :ideas, through: :idea_images
end