require 'spec_helper'

describe Page do
  it "should not save page without title" do
    page = Page.new
    assert !page.save, "Saved page without title"
  end

  it "should ensure page belongs to a category" do
    category = Category.create(:title => "Test Category")
    category.pages.build(:title => "Test Page")
    category.save!
    category.should have(1).pages
  end

  it "should ensure slug gets updated before save" do
    page = Page.create(:title => "Test Page")
    assert page.save!
    page.slug.should == "test-page"
  end
end
