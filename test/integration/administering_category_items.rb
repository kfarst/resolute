require 'test_helper'

class AdministeringCategoryItemsTest < ActionDispatch::IntegrationTest
  def setup
    DatabaseCleaner.start
    @seed_file = File.join(Rails.root, 'db', 'seeds.rb')
    load(@seed_file) if File.exist?(@seed_file)

    DatabaseCleaner.strategy = :truncation, { :except => %w( categories users )} 
  end

  def teardown 
    DatabaseCleaner.clean
  end

  test "creating a category" do
    visit "/users/sign_in"
    fill_in "Email", :with => "farst.6@osu.edu"
    fill_in "Password", :with => "buckeyes44"
    click_button "Sign in"
    visit "/admin"

    click "Edit Categories"
    click "New Item"
    fill_in "Title", :with => "Test Category"
    click "Create Item"

    visit "/test_category"
    click "Sign Out"
  end
end

