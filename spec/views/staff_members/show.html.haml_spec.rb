require 'spec_helper'

describe "staff_members/show.html.haml" do
  before(:each) do
    @staff_member = assign(:staff_member, stub_model(StaffMember,
      :name => "Name",
      :stats => "MyText",
      :bio => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain("MyText".to_s)
  end
end
