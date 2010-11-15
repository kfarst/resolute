require 'spec_helper'

describe "camps/index.html.erb" do
  before(:each) do
    assign(:camps, [
      stub_model(Camp,
        :name => "Name",
        :description => "MyText",
        :location => "Location",
        :group => "Group"
      ),
      stub_model(Camp,
        :name => "Name",
        :description => "MyText",
        :location => "Location",
        :group => "Group"
      )
    ])
  end

  it "renders a list of camps" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Location".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Group".to_s, :count => 2)
  end
end
