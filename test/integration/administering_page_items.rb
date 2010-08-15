require 'test_helper'

class AdministeringPageItemsTest < ActionDispatch::IntegrationTest

  test "creating a page" do
    login 

    click "Edit Pages"
    click "New Item"
    fill_in "Title", :with => "Test Page"
    save_and_open_page
    select "About Us", :from => "Category"
    click "Create Item"

    visit "/test_page"
    logout
  end
end
