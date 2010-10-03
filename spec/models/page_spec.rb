require 'spec_helper'

describe Page do
  it "does not save page without title" do
    page = Page.new
    page.should_not be_valid, "Saved page without title"
  end

  it "ensures page belongs to a category" do
    let(:category) { Category.create(:title => "Test Category") }

    category.pages.build(:title => "Test Page")
    category.should have(1).pages
  end

  it "ensures slug gets updated before save" do
    let(:page) { Page.create(:title => "Test Page") }
    page.slug.should == "test-page"
  end
end
