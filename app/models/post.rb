class Post < ApplicationRecord
  has_many :likes
  belongs_to :user
  attr_accessor :image
  mount_uploader :image, ImageUploader
end
