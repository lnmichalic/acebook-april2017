class User < ApplicationRecord
  include Clearance::User
  validates :name, presence: true
  has_many :posts
end
