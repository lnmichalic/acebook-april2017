class AddReferencesToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :like, foreign_key: true
  end
end
