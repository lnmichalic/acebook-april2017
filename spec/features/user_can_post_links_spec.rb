require 'rails_helper'

RSpec.feature 'URL are converted to clickable links', type: :feature do
  scenario 'user can click on links posted' do
    sign_in
    visit '/posts'
    click_link 'New post'
    fill_in 'Message', with: 'http://rubyonrails.org/'
    click_button 'Submit'
    expect(page).to have_link('', href: 'http://rubyonrails.org/')
  end
end
