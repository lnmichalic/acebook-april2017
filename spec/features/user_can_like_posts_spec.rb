require 'rails_helper'
require "support/features/likes_helpers"
require "support/features/clearance_helpers"

RSpec.feature "Likes", type: :feature do

  scenario "A user cannot see like button unless signed in" do
    sign_in
    make_post
    sign_out
    visit '/posts'
    expect(page).to have_content "Sign up"
  end

  scenario "A post has a like button with like count" do
    sign_in
    make_post
    expect(page).to have_button "Like (0)"
  end

  scenario "A user can like a post" do
    sign_in
    make_post
    click_button "Like (0)"
    expect(page).to have_button("Like (1)", disabled: true)
  end

  scenario "A user cannot like a post twice" do
    sign_in
    make_post
    click_button "Like (0)"
    expect(page).not_to have_button("Like (1)", disabled: false)
  end

end
