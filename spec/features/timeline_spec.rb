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

RSpec.feature 'Users can post to the timeline', type: :feature do

  scenario 'Images can be uploaded to timeline' do
    sign_in
    click_link 'New post'
    attach_file('post_image', Rails.root + 'spec/support/assets/owl.jpg')
    fill_in 'Message', with: 'Test post'
    click_button 'Submit'
    expect(page).to have_xpath("//img[contains(@src,'owl.jpg')]")
  end

  scenario 'Text Posts can be uploaded to timeline' do
    sign_in
    user = User.first
    click_link 'New post'
    fill_in 'Message', with: 'Test post'
    click_button 'Submit'
    expect(page).to have_content "By: #{user.name}"
  end

  scenario 'Posts show the name of posting user' do
    sign_in
    user = User.first
    click_link 'New post'
    attach_file('post_image', Rails.root + 'spec/support/assets/owl.jpg')
    fill_in 'Message', with: 'Test post'
    click_button 'Submit'
    expect(page).to have_content "By: #{user.name}"
  end

end

RSpec.feature "Like Post Functionality", type: :feature do

  scenario "A post has a like button" do
    sign_in
    make_post
    expect(page).to have_button "Like"
  end

  scenario "A user can like a post" do
    sign_in
    make_post
    click_button "Like"
    visit '/'
    expect(page).to have_content("1")
  end

  scenario "A user cannot like a post twice" do
    sign_in
    make_post
    click_button "Like"
    expect(page).not_to have_button "Like"
  end

end
