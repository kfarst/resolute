Given /^I am a site administrator$/ do
  user = User.new(:email => "test@example.com")
  user.password = user.password_confirmation = "password"
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
  click "Edit Pages"
  click "New Item"
  fill_in "Title", :with => title
end

When /^I assign it to the category "([^"]*)"$/ do |category|
  select category, :from => "Category"
  click "Create Item"
end

When /^I have a page titled "([^"]*)"$/ do |page|
  @page = Page.create!(:title => category)
end

When /^I change the page title to "([^"]*)"$/ do |page|
  within("#item_#{@category.id}") do
    click "Edit"
    fill_in 'Title', :with => new_title
  end

  click_button "Update Page"
end

When /^I delete the page$/ do
 within("#item_#{@category.id}") do
    click "Delete"
  end
end

Then /^The page should be deleted$/ do
  pending # express the regexp above with the code you wish you had
end
