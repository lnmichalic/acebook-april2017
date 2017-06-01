require 'rails_helper'
require 'support/features/clearance_helpers'

# This can be removed if/when we decide not to have posts with nil users in
# our production database
RSpec.feature 'Timeline works with nil users', type: :feature do
  scenario 'Timeline doesn\'t explode with nil users' do
    post = Post.new(message: "Here is an anonymous post!")
    post.save(validate: false)
    expect do
      sign_in
      visit '/posts'
    end.not_to raise_error
  end
end
