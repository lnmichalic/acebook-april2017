require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'cannot be created without a user' do
    post = Post.create(message: 'post message')
    expect(post).to_not be_valid
  end

  it 'can be created by a user' do
    user = User.create(name: "User Name", email: "test@example.com",
    password: "my_secret")
    post = user.posts.create(message: "this is the post message")
    expect(post).to be_valid
  end

  it 'belongs to a user' do
    user = User.create(name: "User Name", email: "test@example.com",
    password: "my_secret")
    post = user.posts.create(message: "this is the post message")
    expect(post.user).to eq user
  end

  it 'belongs to a user' do
    user = User.create(name: "User Name", email: "test@example.com",
    password: "my_secret")
    post = Post.create(message: 'post message', user_id: user.id )
    expect(post.user).to eq user
  end

end
