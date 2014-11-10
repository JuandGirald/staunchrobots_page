require 'rails_helper'

RSpec.describe "cvs/show", :type => :view do
  before(:each) do
    @cv = assign(:cv, Cv.create!(
      :name => "Name",
      :profile => "MyText",
      :title => "Title",
      :stackoverflow_reputation => 1,
      :blog => "Blog"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Blog/)
  end
end
