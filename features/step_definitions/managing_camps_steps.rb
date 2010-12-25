Given /^I have a camp with all fields required$/ do
  visit '/camps/new'
  
  within("form") do
    fill_in "Name", :with => (@name = Factory(:camp).name)
    fill_in "Location", :with => Factory(:camp).location
    fill_in "PayPal URL", :with => Factory(:camp).payment_url
    fill_in "Cost", :with => Factory(:camp).cost
    select Factory(:camp).group, :from => "Group"
    check "Name"
    check "Age"
    check "School"
    check "Position"
    check "Email"
    check "Phone"
    check "Address"
    check "Grade"
    check "Years of Experience"
    check "Finding resolute"
    Camp.destroy_all
    click_button "Create Camp"
  end
end

When /^I register for the camp$/ do
  visit "/camps/#{@name.parameterize}"

  fill_in "Name", :with => Factory(:camp_registration).name
  fill_in "Email", :with => Factory(:camp_registration).email
  fill_in "Age", :with => Factory(:camp_registration).age
  check "Attack"
  check "Defense"
  check "Middle"
  check "Goalie"
  fill_in "School", :with => Factory(:camp_registration).school
  fill_in "Phone", :with => Factory(:camp_registration).phone
  fill_in "Street address", :with => Factory(:camp_registration).street_address
  fill_in "City", :with => Factory(:camp_registration).city
  select Factory(:camp_registration).state, :from => "State"
  fill_in "Zip", :with => Factory(:camp_registration).zip
  fill_in "Grade", :with => Factory(:camp_registration).grade
  fill_in "Years of Experience", :with => Factory(:camp_registration).yrs_of_exp
  select Factory(:camp_registration).finding_resolute, :from => "How did you hear about us?"
  fill_in "Comments", :with => Factory(:camp_registration).comments
  click_button "Register and Pay Now"
end

Then /^I will be signed up for the camp$/ do
  response.should redirect_to Factory(:camp_registration).payment_url

  visit "/camp_registrations"
  page.should have_content @name
end

When /^I register for the camp with empty data$/ do
  visit "/camps/#{@name.parameterize}"
  click_button "Register and Pay Now"
end

Then /^I will get an error message$/ do
  page.should have_content("prohibited this Camp Registration from being saved:")
end

When /^I register for the camp with bad data$/ do
  fill_in "Name", :with => Factory(:camp_registration).name
  fill_in "Email", :with => "s0uf3w0jg"
  fill_in "Age", :with => "lskj3et40"
  check "Attack"
  check "Defense"
  check "Middle"
  check "Goalie"
  fill_in "School", :with => Factory(:camp_registration).school
  fill_in "Phone", :with => "wogjw203t4"
  fill_in "Street address", :with => Factory(:camp_registration).street_address
  fill_in "City", :with => Factory(:camp_registration).city
  select Factory(:camp_registration).state, :from => "State"
  fill_in "Zip", :with => "0vgjsa"
  fill_in "Grade", :with => 50
  fill_in "Years of Experience", :with => "w0jf"
  select Factory(:camp_registration).finding_resolute, :from => "How did you hear about us?"
  fill_in "Comments", :with => Factory(:camp_registration).comments
  click_button "Register and Pay Now"
end
