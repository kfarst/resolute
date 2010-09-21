require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not save category without title" do
    category = Category.new
    assert !category.save, "Saved category without title"
  end

  test "should ensure a cateogy's pages get destroyed if the category gets destroyed" do
    category = Category.create(:title => "Test Category")
    category.pages.build(:title => "Test Page")
    assert category.pages.count == 1

    page_name = category.pages.first.title
    category.destroy
    assert_nil Page.find_by_title(page_name)
  end

  test "should ensure slug gets updated before save" do
    category = Category.new(:title => "Test Category")
    assert category.save!
    assert_equal category.slug, "test-category"
  end
end
