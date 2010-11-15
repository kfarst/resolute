require 'spec_helper'

describe "camps/show.html.erb" do
  before(:each) do
    @camp = assign(:camp, stub_model(Camp,
      :name => "Name",
      :description => "MyText",
      :location => "Location",
      :group => "Group"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain("Location".to_s)
    rendered.should contain("Group".to_s)
  end
end
