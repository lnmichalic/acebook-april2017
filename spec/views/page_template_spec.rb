require 'rails_helper'

RSpec.feature "Page Template", type: :feature do
  scenario 'Will have a footer on home page' do
    visit '/'
    expect(page.source).to include("<footer>")
    expect(page.source).to include("</footer>")
  end
end
