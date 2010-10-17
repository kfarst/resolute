When /^I create a category titled "([^"]*)"$/ do |title|
  click "Manage Categories"
  click "New Item"
  fill_in "Title", :with => title 
  click "Create Item"
end

When /^I have a category titled "([^"]*)"$/ do |title|
  @category = Category.create!(:title => title)
end

When /^I change the category title to "([^"]*)"$/ do |new_title|
  click "Manage Categories"

  within("#item_#{@category.id}") do
    click "Edit"
  end

  fill_in 'Title', :with => new_title
  click_button "Update Category"
end

Then /^The category title should be "([^"]*)"$/ do |category_name|
  page.should have_content(category_name)
end

When /^I delete the category$/ do
  click "Manage Categories"

  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")

  within("#item_#{@category.id}") do
    click "Destroy"
  end
end

Then /^The category should be deleted$/ do
  page.should_not have_content(@category.title)
end
