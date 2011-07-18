Given /^I am a site administrator$/ do
  @user = Factory(:user)
  Factory(:category)
end

Given /^I am logged in$/ do
  ["Left", "Right Top", "Right Bottom"].each_with_index do |position, index|
    Panel.create!(:title => "Panel #{index}", 
                  :url =>"panel-#{index}",
                  :panel => "panel#{index}.png",  
                  :position => position)
  end

  visit "/users/sign_in"
  fill_in "Email", :with => @user.email
  fill_in "Password", :with => @user.password
  click_button "Sign in"
  visit "/admin"
end

When /^I create a page titled "([^"]*)"$/ do |title|
  click_link "Manage Pages"
  click_link "New Item"
  fill_in "Title", :with => title
end

When /^I assign it to the category "([^"]*)"$/ do |category|
  select "#{category}", :from => "Category"
  click_button "Create Item"
end

When /^I have a page titled "([^"]*)"$/ do |page|
  @page = Page.create!(:title => page, :category_id => 1)
end

When /^I change the page title to "([^"]*)"$/ do |new_title|
  click_link "Manage Pages"

  within("#item_#{@page.id}") do
    click_link "Edit"
  end

  fill_in 'Title', :with => new_title
  click_button "Update Page"
end

When /^I delete the page$/ do
  click_link "Manage Pages"

  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")

  within("#item_#{@page.id}") do
    click_link "Destroy"
  end

end

Then /^The page should be deleted$/ do
  page.should_not have_content(@page.title)
end
