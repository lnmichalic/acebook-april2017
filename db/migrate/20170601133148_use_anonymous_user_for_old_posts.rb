require 'digest/sha1'

class UseAnonymousUserForOldPosts < ActiveRecord::Migration[5.1]
  def up
    random_password = Digest::SHA1.hexdigest (rand 50000000).to_s
    user = User.create!({name: "Anonymous", email: "anonymous@example.com", password: random_password})
    Post.all.each do |post|
      next unless post.user.nil?
      post.user = user
      post.save!
    end
  end

  def down
    user = User.find_by({email: "anonymous@example.com"})
    posts = Post.where({user: user})
    Post.all.each do |post|
      post.user = nil
      post.save!(validate: false)
    end
    user.destroy!
  end
end
