require 'rails_helper'

RSpec.describe User, type: :model do
  it "it is valid with valid attributes" do
    user = User.new
    user.name = 'TestyMcTestFace'
    user.email = "test@test.com"
    user.password = "password"
    user.save
    expect(user).to be_valid
  end

  it "it is not valid without a name" do
    user = User.new
    user.email = "test@test.com"
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "it is not valid without a email" do
    user = User.new
    user.name = 'TestyMcTestFace'
    user.password = "password"
    user.save
    expect(user).to_not be_valid
  end

  it "it is not valid without a password"do
    user = User.new
    user.name = 'TestyMcTestFace'
    user.email = "test@test.com"
    user.save
    expect(user).to_not be_valid
  end

end
