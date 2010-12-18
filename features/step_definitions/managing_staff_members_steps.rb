When /^I fill out the new staff member form$/ do
  click_link "New Staff Member"
  fill_in "Name", :with => "John Smith"
  click_link "Add Stat"
  click_link "Add Stat"
  fill_in "Bio", :with => "This is John Smith's bio stuff which is a paragraph or so of info that doesn't belong as a stat."
  click_button "Create Staff Member"
end

Then /^the staff member should be listed on the admin page$/ do
  page.should have_content "John Smith"
end

Then /^the staff member should be listed on the staff members page$/ do
  visit "/staff"
  page.should have_content "John Smith"
end
