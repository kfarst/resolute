require 'test_helper'

class AdministeringPageItemsTest < ActionDispatch::IntegrationTest
  def setup
    DatabaseCleaner.start
    @seed_file = File.join(Rails.root, 'db', 'seeds.rb')
    load(@seed_file) if File.exist?(@seed_file)

    DatabaseCleaner.strategy = :truncation, { :except => %w( categories users )} 
  end

  def teardown 
    DatabaseCleaner.clean
  end

  test "creating a page" do
    visit "/users/sign_in"
    fill_in "Email", :with => "farst.6@osu.edu"
    fill_in "Password", :with => "buckeyes44"
    click_button "Sign in"
    visit "/admin"

    click "Edit Pages"
    click "New Item"
    fill_in "Title", :with => "Test Page"
    save_and_open_page
    select "About Us", :from => "Category"
    click "Create Item"

    visit "/test_page"
    click "Sign Out"
  end
end
