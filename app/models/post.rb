class Post < ApplicationRecord

  has_many :likes
  attr_accessor :image
  mount_uploader :image, ImageUploader

end
