require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    sign_in
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can submit multi-line posts and view them as multi-line" do
    sign_in
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello,\n world!"
    click_button "Submit"
    expect(page.source).to include("Hello,\n<br /> world!")
  end
end
