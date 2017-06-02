require 'rails_helper'
require "support/features/clearance_helpers"

RSpec.feature 'Posts can be commented on and comments are displayed', type: :feature do
  let(:user) { User.create(name: "Tester", email: "test@example.com", password: "secret") }
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

  feature 'Comments have user names next to them' do
    scenario 'User can see name next to comments' do
      sign_in
      visit '/posts'
      click_link 'New post'
      fill_in 'Message', with: 'First Post'
      click_button 'Submit'
      fill_in 'comment[body]', with: 'This is a comment, look at my comment'
      click_button 'Create Comment'
      expect(page).to have_current_path('/posts')
      expect(page).to have_content('TestyMcTestFace: This is a comment, look at my comment')
    end
  end

  feature 'Comments can be deleted' do
    scenario 'Click delete removes the comment' do
      sign_in
      visit '/posts'
      click_link 'New post'
      fill_in 'Message', with: 'First Post'
      click_button 'Submit'
      fill_in 'comment[body]', with: 'This is a comment, look at my comment'
      click_button 'Create Comment'
      click_link 'Delete Comment'
      expect(page).to_not have_content('TestyMcTestFace: This is a comment, look at my comment')
    end

    scenario 'Can only delete personal comment' do
      sign_in
      visit '/posts'
      click_link 'New post'
      fill_in 'Message', with: 'First Post'
      click_button 'Submit'
      fill_in 'comment[body]', with: 'This is a comment, look at my comment'
      click_button 'Create Comment'
      click_link 'Sign out'
      sign_up_with('ahmed', 'egypt@egypt.com', 'tron123')
      expect(page).to_not have_content('Delete Comment')
    end
  end
end
