require 'rails_helper'
require_relative "../support/features/clearance_helpers.rb"

RSpec.feature "Likes", type: :feature do
  scenario "Can like posts and posts show like count" do
    email = "jay@example.com"
    visit "/"
    expect(page).not_to have_button "Like"
    click_link "Sign in"
    click_link "Sign up"
    fill_in "Email", with: email
    fill_in "Password", with: "my_secret"
    click_button "Sign up"
    expect(page).to have_content "Signed in as: #{email}"
    click_link 'New post'
    fill_in 'Message', with: 'Post to be liked'
    click_button 'Submit'
    expect(page).to have_button "Like (0)"
    click_button "Like (0)"
    expect(page).to have_button "Like (1)"
    click_button "Like (1)"
    expect(page).to have_button "Like (2)"
  end
end
