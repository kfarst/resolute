Given /^I am a site administrator$/ do
  user = User.new(:email => "test@example.com")
  user.password, user.password_confirmation = "password"
  user.save!
  Category.create!(:title => "About Us")
end

Given /^I am logged in$/ do
  visit "/users/sign_in"
  fill_in "Email", :with => "test@example.com"
  fill_in "Password", :with => "password"
  click_button "Sign in"
  visit "/admin"
end

When /^I create a page titled "([^"]*)"$/ do |title|
  click "Manage Pages"
  click "New Item"
  fill_in "Title", :with => title
end

When /^I assign it to the category "([^"]*)"$/ do |category|
  select "#{category}", :from => "Category"
  click "Create Item"
end

When /^I have a page titled "([^"]*)"$/ do |page|
  @page = Page.create!(:title => page, :category_id => 1)
end

When /^I change the page title to "([^"]*)"$/ do |new_title|
  click "Manage Pages"

  within("#item_#{@page.id}") do
    click "Edit"
  end

  fill_in 'Title', :with => new_title
  click_button "Update Page"
end

When /^I delete the page$/ do
  click "Manage Pages"

  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")

  within("#item_#{@page.id}") do
    click "Destroy"
  end

end

Then /^The page should be deleted$/ do
  page.should_not have_content(@page.title)
end
