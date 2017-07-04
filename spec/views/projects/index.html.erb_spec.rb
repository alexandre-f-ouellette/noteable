require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :name => "Name",
        :short_name => "Short Name"
      ),
      Project.create!(
        :name => "Name",
        :short_name => "Short Name"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
  end
end
