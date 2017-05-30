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
