class Post < ApplicationRecord
  has_many :likes
  belongs_to :user
  has_many :comments
  attr_accessor :image
  mount_uploader :image, ImageUploader
end
