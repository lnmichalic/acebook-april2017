class User < ApplicationRecord
  include Clearance::User
  validates :name, presence: true
  mount_uploader :avatar, ImageUploader
end
