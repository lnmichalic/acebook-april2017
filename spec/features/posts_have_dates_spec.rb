require 'rails_helper'

RSpec.feature 'Posts show the date and time they were posted', type: :feature do
  scenario 'Posts have date and time attatched' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'Post Number One'
    click_button 'Submit'
    date = Time.now.utc.strftime('%d/%m/%Y')
    time = Time.now.utc.strftime('%H:%M')
    expect(page).to have_content("Post Number One Posted on #{date} at #{time}")
  end
end
