require 'rails_helper'

RSpec.describe "post_tags/show", type: :view do
  before(:each) do
    @post_tag = assign(:post_tag, PostTag.create!(
      :user_id => 2,
      :post_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
