class Post < ApplicationRecord
  has_many :likes
  has_many :post_tags
  attr_accessor :image
  mount_uploader :image, ImageUploader
end
