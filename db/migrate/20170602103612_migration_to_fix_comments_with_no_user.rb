class MigrationToFixCommentsWithNoUser < ActiveRecord::Migration[5.1]
  def up
    user = User.find_by(email: "anon@acebook.com")
    Comment.all.each do |comment|
      comment.user_id ||= user.id
      comment.save!
    end
  end

  def down
    user = User.find_by(email: "anon@acebook.com")
    user.comments.each do |comment|
      comment.user_id = nil
      comment.save!(validate: false)
    end
  end
end
