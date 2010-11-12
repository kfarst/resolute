When /^I fill out the new product form with sizes$/ do
  click_link "New Product"
  fill_in "Name", :with => "Shirt"
  fill_in "Price", :with => "12.00"
  fill_in "Size", :with => "Small,Medium,Large"
  attach_file("Picture", File.join(Rails.root, 'spec', 'fixtures', 'shirt.png'))
  click_button "Create Product"
end

Then /^the product should be listed$/ do
  page.should have_content "Shirt"
  page.should have_content "$12.00"
end

Then /^the product should have a sizes select menu$/ do
  page.should have_content "Size"
end

When /^I fill out the new product form without sizes$/ do
  click_link "New Product"
  fill_in "Name", :with => "Shirt"
  fill_in "Price", :with => "12.00"
  attach_file("Picture", File.join(Rails.root, 'spec', 'fixtures', 'shirt.png'))
  click_button "Create Product"
end

Then /^the product should not have a sizes select menu$/ do
  page.should_not have_content "Size"
end
