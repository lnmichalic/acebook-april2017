require 'rails_helper'

RSpec.describe "post_tags/edit", type: :view do
  before(:each) do
    @post_tag = assign(:post_tag, PostTag.create!(
      :user_id => 1,
      :post_id => 1
    ))
  end

  it "renders the edit post_tag form" do
    render

    assert_select "form[action=?][method=?]", post_tag_path(@post_tag), "post" do

      assert_select "input[name=?]", "post_tag[user_id]"

      assert_select "input[name=?]", "post_tag[post_id]"
    end
  end
end
