require 'rails_helper'
require "support/features/likes_helpers"

RSpec.feature "Likes", type: :feature do

  scenario "Cannot see like button unless signed in" do
    make_post
    expect(page).not_to have_button "Like (0)"
  end

  scenario "Has like button with like count" do
    email = "name@example.com"
    sign_in(email)
    make_post
    expect(page).to have_button "Like (0)"
  end

  scenario "Can like a post" do
    email = "name@example.com"
    sign_in(email)
    make_post
    click_button "Like (0)"
    expect(page).to have_button("Like (1)", disabled: true)
  end

  scenario "Cannot like a post twice" do
    email = "name@example.com"
    sign_in(email)
    make_post
    click_button "Like (0)"
    expect(page).not_to have_button("Like (1)")
  end

end
