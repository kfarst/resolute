When /^I create a category titled "([^"]*)"$/ do |title|
  click "Edit Categories"
  click "New Item"
  fill_in "Title", :with => title 
end

When /^I have a category titled "([^"]*)"$/ do |title|
  @category = Category.create!(:title => title)
end

When /^I change the category title to "([^"]*)"$/ do |new_title|
  within("#item_#{@category.id}") do
    click "Edit"
    fill_in 'Title', :with => new_title
  end

  click_button "Update Category"
end

Then /^The category title should be "([^"]*)"$/ do |category_name|
  page.has_content?(category_name)
end

When /^I delete the category$/ do
 within("#item_#{@category.id}") do
    click "Delete"
  end
end

Then /^The category should be deleted$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^All pages belonging to the category should be deleted$/ do
  pending # express the regexp above with the code you wish you had
end


