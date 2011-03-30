Given /^I have a category with the tournament entry form on it$/ do
  @category = Category.create!(:title => "Test Category", :include_tournament_entry_form => true)
  visit "/#{@category.title.parameterize}"
end

When /^I sign up for the tournament with no data$/ do
  fill_in "Team name", :with => ""
  fill_in "Coach's Name", :with => ""
  fill_in "Coach's Phone Number", :with => ""
  fill_in "Coach's Email Address", :with => ""
  fill_in "Program Director's Name", :with => ""
  select "", :from => "Division"
  fill_in "Street address", :with => ""
  fill_in "City", :with => ""
  select "", :from => "State"
  fill_in "Zip Code", :with => ""
  click_button "Sign My Team Up"
end

When /^I sign up for the tournament with bad data$/ do
  fill_in "Team name", :with => "Test Team"
  fill_in "Coach's Name", :with => "John Smith"
  fill_in "Coach's Phone Number", :with => "02gjf0j93f02"
  fill_in "Coach's Email Address", :with => "v02j0fj209j3"
  fill_in "Program Director's Name", :with => "Andy Samberg"
  select "5/6 A", :from => "Division"
  fill_in "Street address", :with => "123 Fake Street"
  fill_in "City", :with => "Columbus"
  select "OH", :from => "State"
  fill_in "Zip Code", :with => "02jf02jf"
  click_button "Sign My Team Up"
end

When /^I sign up for the tournament with correct data$/ do
  fill_in "Team name", :with => "Test Team"
  fill_in "Coach's Name", :with => "John Smith"
  fill_in "Coach's Phone Number", :with => "(483) 483-2394"
  fill_in "Coach's Email Address", :with => "smith@example.com"
  fill_in "Program Director's Name", :with => "Andy Samberg"
  select "5/6 A", :from => "Division"
  fill_in "Street address", :with => "123 Fake Street"
  fill_in "City", :with => "Columbus"
  select "OH", :from => "State"
  fill_in "Zip Code", :with => "39204"
  click_button "Sign My Team Up"
end

Then /^I should be entered into the tournament$/ do
  TournamentEntry.all.size.should == 1
end

Given /^I have a tournament entry$/ do
  Factory(:tournament_entry)
end
