Given /^I am a visitor$/ do
  destroy_user_session_path
end

When /^I fill out the camp registration form$/ do
  fill_in "Name", :with => "John Smith"
  fill_in "Email", :with => "smith@example.com"
  fill_in "Phone", :with => "323-439-2342"
  fill_in "Age", :with => "12"
  fill_in "School", :with => "James Woods High School"
  fill_in "Position", :with => "Defense"
  choose "camp_registration_camp_level_High_School"
  fill_in "Comments", :with => "English are a fun subjekt in skewl!"
  click "Register and Pay Now"
end

Then /^I will be signed up for the camp$/ do
  page.should_not have_content "prohibited this Camp Registration from being saved:"
end

When /^I fill out the contact us form$/ do
  fill_in "First name", :with => "John"
  fill_in "Last name", :with => "Smith"
  fill_in "Email", :with => "smith@example.com"
  fill_in "Message", :with => "English are a fun subjekt in skewl!"
  click "Send Message"
end

Then /^it sends a message to the website$/ do
  page.should have_content "Message sent! Thank you for contacting us."
end

When /^I fill out the contest form$/ do
  fill_in "Name", :with => "John Smith"
  fill_in "Email", :with => "smith@example.com"
  fill_in "Age", :with => "12"
  fill_in "School", :with => "James Woods High School"
  fill_in "Position", :with => "Defense"
  click "Enter Contest"
end

Then /^I will be signed up for the contest$/ do
  page.should have_content "Contest was successfully entered."
end
