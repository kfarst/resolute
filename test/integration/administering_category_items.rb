require 'test_helper'

class AdministeringCategoryItemsTest < ActionDispatch::IntegrationTest

  test "creating a category" do
    login

    click "Edit Categories"
    click "New Item"
    fill_in "Title", :with => "Test Category"
    click "Create Item"

    visit "/test_category"
    logout
  end
end

