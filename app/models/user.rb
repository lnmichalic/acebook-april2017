class User < ApplicationRecord
  include Clearance::User
  AVATAR_SIZES = { thumb: 15, small: 50, medium: 150, large: 300 }
  validates :name, presence: true
  has_many :posts
  has_many :comments
  mount_uploader :avatar, ImageUploader
end
