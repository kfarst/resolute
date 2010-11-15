require 'spec_helper'

describe "camps/new.html.erb" do
  before(:each) do
    assign(:camp, stub_model(Camp,
      :new_record? => true,
      :name => "MyString",
      :description => "MyText",
      :location => "MyString",
      :group => "MyString"
    ))
  end

  it "renders new camp form" do
    render

    rendered.should have_selector("form", :action => camps_path, :method => "post") do |form|
      form.should have_selector("input#camp_name", :name => "camp[name]")
      form.should have_selector("textarea#camp_description", :name => "camp[description]")
      form.should have_selector("input#camp_location", :name => "camp[location]")
      form.should have_selector("input#camp_group", :name => "camp[group]")
    end
  end
end
