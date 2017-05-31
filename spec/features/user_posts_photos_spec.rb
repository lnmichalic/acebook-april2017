require 'rails_helper'

RSpec.feature 'Users can post photos to the timeline', type: :feature do
  scenario 'Uploaded images appear on the next screen' do
    sign_in
    click_link 'New post'
    attach_file('post_image', Rails.root + 'public/owl.jpg')
    fill_in 'Message', with: 'Test post'
    click_button 'Submit'
    expect(page).to have_xpath("//img[contains(@src,'owl.jpg')]")
  end
end
