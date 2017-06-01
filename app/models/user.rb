class User < ApplicationRecord
  include Clearance::User
  AVATAR_SIZES = {:small => 70, :medium => 150, :large => 300}
  validates :name, presence: true
  mount_uploader :avatar, ImageUploader
end
