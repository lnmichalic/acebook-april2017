require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'can be created with user id and post id' do
    user = User.create(email: "test@example.com", password: "secret")
    post = Post.create(message: "post message")
    comment = Comment.create(body: "This is a comment", post_id: post.id, user_id: user.id)
    expect(comment.user_id).to eq user.id
    expect(comment.post_id).to eq post.id
    expect(comment.body).to eq("This is a comment")
    expect(comment.id).not_to be_nil
  end
end
