require 'rails_helper'

RSpec.describe Comment, type: :model do

  let(:user) { User.create(name: "Tester", email: "test@example.com", password: "secret") }
  let(:post) { Post.create(message: "post message", user_id: user.id) }

  it 'can be created with user id and post id' do
    comment = Comment.create(body: "This is a comment", post_id: post.id, user_id: user.id)
    expect(comment.user_id).to eq user.id
    expect(comment.post_id).to eq post.id
    expect(comment.body).to eq("This is a comment")
    expect(comment.user.name).to eq("Tester")
    expect(comment).to be_valid
  end

  it 'Cannot be empty' do
    comment = Comment.create(body: " ", post_id: post.id, user_id: user.id)
    expect(comment).to_not be_valid
  end

  it 'Cannot be longer than 150 characters' do
    comment = Comment.create(body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", post_id: post.id, user_id: user.id)
    expect(comment).to_not be_valid
  end

  it 'Cannot be shorter than 2 characters' do
    comment = Comment.create(body: "A", post_id: post.id, user_id: user.id)
    expect(comment).to_not be_valid
  end

end
