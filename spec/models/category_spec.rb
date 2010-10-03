require 'spec_helper'

describe Category do
  it "does not save category without title" do
    category = Category.new
    category.should_not be_valid, "Saved category without title"
  end

  context "has child pages" do
    let(:category) { Category.create!(:title => "Test Category") }

    it "ensures the pages get destroyed if the category gets destroyed" do

      category.pages.build(:title => "Test Page")
      category.should have(1).pages

      page_name = category.pages.first.title
      category.destroy!
      Page.find_by_title(page_name).should be_nil
    end
  end

  it "ensures slug gets updated before save" do
    let(:category) { Category.create!(:title => "Test Category") }

    category = Category.create!(:title => "Test Category")
    category.slug.should == "test-category"
  end
end
