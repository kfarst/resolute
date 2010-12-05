require 'spec_helper'

describe "staff_members/index.html.haml" do
  before(:each) do
    assign(:staff_members, [
      stub_model(StaffMember,
        :name => "Name",
        :stats => "MyText",
        :bio => "MyText"
      ),
      stub_model(StaffMember,
        :name => "Name",
        :stats => "MyText",
        :bio => "MyText"
      )
    ])
  end

  it "renders a list of staff_members" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
