require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "should not save page without title" do
    page = Page.new
    assert !page.save, "Saved page without title"
  end

  test "should ensure page belongs to a category" do
    category = Category.create(:title => "Test Category")
    category.pages.build(:title => "Test Page")
    category.save!
    assert category.pages.count == 1
  end

  test "should ensure slug gets updated before save" do
    page = Page.create(:title => "Test Page")
    assert page.save!
    assert_equal page.slug, "test-page"
  end
end
