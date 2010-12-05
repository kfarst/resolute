require 'spec_helper'

describe "staff_members/edit.html.haml" do
  before(:each) do
    @staff_member = assign(:staff_member, stub_model(StaffMember,
      :new_record? => false,
      :name => "MyString",
      :stats => "MyText",
      :bio => "MyText"
    ))
  end

  it "renders the edit staff_member form" do
    render

    rendered.should have_selector("form", :action => staff_member_path(@staff_member), :method => "post") do |form|
      form.should have_selector("input#staff_member_name", :name => "staff_member[name]")
      form.should have_selector("textarea#staff_member_stats", :name => "staff_member[stats]")
      form.should have_selector("textarea#staff_member_bio", :name => "staff_member[bio]")
    end
  end
end
