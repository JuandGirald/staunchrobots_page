require 'rails_helper'

RSpec.describe "cvs/index", :type => :view do
  before(:each) do
    assign(:cvs, [
      Cv.create!(
        :name => "Name",
        :profile => "MyText",
        :title => "Title",
        :stackoverflow_reputation => 1,
        :blog => "Blog"
      ),
      Cv.create!(
        :name => "Name",
        :profile => "MyText",
        :title => "Title",
        :stackoverflow_reputation => 1,
        :blog => "Blog"
      )
    ])
  end

  it "renders a list of cvs" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Blog".to_s, :count => 2
  end
end
