require 'spec_helper'

describe Category do
  it "should not save category without title" do
    category = Category.new
    category.save.should_not be_true, "Saved category without title"
  end

  it "should ensure a cateogy's pages get destroyed if the category gets destroyed" do
    category = Category.create!(:title => "Test Category")
    category.pages.build(:title => "Test Page")
    assert category.pages.count == 1

    page_name = category.pages.first.title
    category.destroy
    Page.find_by_title(page_name).should be_nil
  end

  it "should ensure slug gets updated before save" do
    category = Category.create!(:title => "Test Category")
    category.slug.should == "test-category"
  end
end
