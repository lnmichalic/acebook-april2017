class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  attr_accessor :image
  mount_uploader :image, ImageUploader
end
