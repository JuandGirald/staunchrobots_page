require 'rails_helper'

RSpec.describe "cvs/edit", :type => :view do
  before(:each) do
    @cv = assign(:cv, Cv.create!(
      :name => "MyString",
      :profile => "MyText",
      :title => "MyString",
      :stackoverflow_reputation => 1,
      :blog => "MyString"
    ))
  end

  it "renders the edit cv form" do
    render

    assert_select "form[action=?][method=?]", cv_path(@cv), "post" do

      assert_select "input#cv_name[name=?]", "cv[name]"

      assert_select "textarea#cv_profile[name=?]", "cv[profile]"

      assert_select "input#cv_title[name=?]", "cv[title]"

      assert_select "input#cv_stackoverflow_reputation[name=?]", "cv[stackoverflow_reputation]"

      assert_select "input#cv_blog[name=?]", "cv[blog]"
    end
  end
end
