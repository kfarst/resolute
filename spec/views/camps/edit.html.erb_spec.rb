require 'spec_helper'

describe "camps/edit.html.erb" do
  before(:each) do
    @camp = assign(:camp, stub_model(Camp,
      :new_record? => false,
      :name => "MyString",
      :description => "MyText",
      :location => "MyString",
      :group => "MyString"
    ))
  end

  it "renders the edit camp form" do
    render

    rendered.should have_selector("form", :action => camp_path(@camp), :method => "post") do |form|
      form.should have_selector("input#camp_name", :name => "camp[name]")
      form.should have_selector("textarea#camp_description", :name => "camp[description]")
      form.should have_selector("input#camp_location", :name => "camp[location]")
      form.should have_selector("input#camp_group", :name => "camp[group]")
    end
  end
end
