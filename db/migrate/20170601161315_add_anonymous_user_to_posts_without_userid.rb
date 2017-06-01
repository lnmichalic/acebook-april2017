
class AddAnonymousUserToPostsWithoutUserid < ActiveRecord::Migration[5.1]
  def up
    password = (0...15).map { ('a'..'z').to_a[rand(25)] }.join
    user = User.create(name: "Anonymous", email: "anon@acebook.com", password: password)
    Post.all.each { |post|
      post.user_id ||= user.id
      post.save
    }
  end

  def down
    user = User.find_by(email: "anon@acebook.com")
    user.posts.each { |post|
      post.user_id = nil
      post.save(validate: false)
    }
    user.destroy
  end
end
