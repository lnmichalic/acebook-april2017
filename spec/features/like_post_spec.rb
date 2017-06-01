require 'rails_helper'
require "support/features/likes_helpers"
require "support/features/clearance_helpers"

RSpec.feature "Likes", type: :feature do

  scenario "A post has a like button with like count" do
    sign_in
    make_post
    expect(page).to have_button "Like"
  end

  scenario "A user can like a post" do
    sign_in
    make_post
    click_button "Like"
    expect(page).not_to have_button "Like"
    expect(page).to have_content("1")
  end

  scenario "A user cannot like a post twice" do
    sign_in
    make_post
    click_button "Like (0)"
    expect(page).not_to have_button("Like (1)", disabled: false)
  end

end
