require 'rails_helper'

RSpec.describe "post_tags/index", type: :view do
  before(:each) do
    assign(:post_tags, [
      PostTag.create!(
        :user_id => 2,
        :post_id => 3
      ),
      PostTag.create!(
        :user_id => 2,
        :post_id => 3
      )
    ])
  end

  it "renders a list of post_tags" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
