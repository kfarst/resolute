When /^I create a category titled "([^"]*)"$/ do |title|
  click_link "Manage Categories"
  click_link "New Item"
  fill_in "Title", :with => title 
  click_button "Create Item"
end

When /^I have a category titled "([^"]*)"$/ do |title|
  @category = Category.create!(:title => title)
end

When /^I change the category title to "([^"]*)"$/ do |new_title|
  click_link "Manage Categories"

  within("#item_#{@category.id}") do
    click_link "Edit"
  end

  fill_in 'Title', :with => new_title
  click_button "Update Category"
end

Then /^The category title should be "([^"]*)"$/ do |category_name|
  page.should have_content(category_name)
end

When /^I delete the category$/ do
  click_link "Manage Categories"

  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")

  within("#item_#{@category.id}") do
    click_link "Destroy"
  end
end

Then /^The category should be deleted$/ do
  page.should_not have_content(@category.title)
end
