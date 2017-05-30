require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  scenario "Can only visit wall when signed in" do
    visit "/"
    expect(page).to have_current_path('/sign_up')
  end

  scenario "Root visits wall when signed in" do
    sign_in
    visit "/"
    expect(page).to have_current_path('/posts')
  end
end
