module Features
  module LikesHelpers
    def sign_in(email)
      visit "/"
      click_link "Sign in"
      click_link "Sign up"
      fill_in "Email", with: email
      fill_in "Password", with: "my_secret"
      click_button "Sign up"
    end

    def make_post
      visit "/"
      click_link 'New post'
      fill_in 'Message', with: 'Post to be liked'
      click_button 'Submit'
    end
  end
end

RSpec.configure do |config|
  config.include Features::LikesHelpers, type: :feature
end
