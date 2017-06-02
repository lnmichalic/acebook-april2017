require 'rails_helper'
require "support/features/likes_helpers"
require "support/features/clearance_helpers"

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_in
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit multi-line posts and view them as multi-line" do
    sign_in
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello,\n world!"
    click_button "Submit"
    expect(page.source).to include("Hello,\n<br /> world!")
  end

  scenario 'user can click on links posted' do
   sign_in
   visit '/posts'
   click_link 'New post'
   fill_in 'Message', with: 'http://rubyonrails.org/'
   click_button 'Submit'
   expect(page).to have_link('', href: 'http://rubyonrails.org/')
  end

  scenario 'User can see comments' do
    sign_in
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'First Post'
    click_button 'Submit'
    fill_in 'comment[body]', with: 'This is a comment, look at my comment'
    click_button 'Create Comment'
    expect(page).to have_current_path('/posts')
    expect(page).to have_content('This is a comment, look at my comment')
  end
end

RSpec.feature "Avatar", type: :feature do
  scenario "User signs up with avatar, is displayed on welcome" do
    visit "/"
    fill_in "user_name", with: "John Doe"
    fill_in "user_email", with: "name@example.com"
    fill_in "user_password", with: "my_secret"
    attach_file('user_avatar', Rails.root + 'spec/support/assets/owl.jpg')
    click_button "Sign up"
    expect(page).to have_xpath("//img[contains(@src,'owl.jpg')]")
  end
end
