require 'rails_helper'

RSpec.feature 'Posts show in reverse chronological order', type: :feature do
  scenario 'User sees most recent post first' do
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
    expect(page).to have_content("Post Number One Posted on #{date} at #{time}")
  end
end
