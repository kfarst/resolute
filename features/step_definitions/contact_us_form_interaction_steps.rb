Given /^I am a visitor$/ do
  destroy_user_session_path
end

When /^I fill out the contact us form$/ do
  fill_in "First name", :with => "John"
  fill_in "Last name", :with => "Smith"
  fill_in "Email", :with => "smith@example.com"
  fill_in "Message", :with => "English are a fun subjekt in skewl!"
  click "Send Message"
end

When /^I fill out the contact us form with bad data$/ do
  fill_in "First name", :with => "John"
  fill_in "Last name", :with => "Smith"
  fill_in "Email", :with => "l2o3rj230fj20"
  fill_in "Message", :with => "English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!
                              English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!
                              English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!
                              English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!
                              English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!
                              English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!
                              English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!
                              English are a fun subjekt in skewl! English are a fun subjekt in skewl! English are a fun subjekt in skewl!"
  click "Send Message"
end

When /^I fill out the contact us form with missing data$/ do
  fill_in "First name", :with => ""
  fill_in "Last name", :with => ""
  fill_in "Email", :with => ""
  fill_in "Message", :with => ""
  click "Send Message"
end

Then /^it sends a message to the website$/ do
  page.should have_content "Message sent! Thank you for contacting us."
end

Then /^it displays error messages$/ do
  page.should have_content "prohibited this message from being sent:"
end
