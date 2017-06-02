require 'rails_helper'

RSpec.feature 'Posts show in reverse chronological order', type: :feature do
  scenario 'User sees most recent post first' do
    sign_in
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'First Post'
    click_button 'Submit'
    click_link 'New post'
    fill_in 'Message', with: 'Second Post'
    click_button 'Submit'
    expect(first('p')).to have_content('Second Post')
  end
end

RSpec.feature 'Posts show the date and time they were posted', type: :feature do
  scenario 'Posts have date and time attatched' do
    sign_in
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Post Number One'
    click_button 'Submit'
    date = Time.zone.now.strftime('%d/%m/%Y')
    time = Time.zone.now.strftime('%H:%M')
    expect(page).to have_content("#{date} at #{time}")
  end
end

RSpec.feature 'Users can post photos to the timeline', type: :feature do
  scenario 'Uploaded images appear on the next screen' do
    sign_in
    click_link 'New post'
    attach_file('post_image', Rails.root + 'spec/support/assets/owl.jpg')
    fill_in 'Message', with: 'Test post'
    click_button 'Submit'
    expect(page).to have_xpath("//img[contains(@src,'owl.jpg')]")
  end
end

RSpec.feature 'Users can post messages to the timeline', type: :feature do
  scenario 'Posts show the name of posting user' do
    sign_in
    click_link 'New post'
    attach_file('post_image', Rails.root + 'spec/support/assets/owl.jpg')
    fill_in 'Message', with: 'Test post'
    click_button 'Submit'
    expect(page).to have_content "By: TestyMcTestFace"
  end
end
