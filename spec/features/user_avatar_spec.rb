require 'rails_helper'

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
