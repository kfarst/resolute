When /^I add three new panels$/ do
  within_fieldset("Left") do
    fill_in "Title", :with => "Panel 1"
    fill_in "Url", :with => "panel-1"
    attach_file "Panel", "#{Rails.root}/spec/fixtures/winter-clinics.png"
  end

  within_fieldset("Right Top") do
    fill_in "Title", :with => "Panel 2"
    fill_in "Url", :with => "panel-2"
    attach_file "Panel", "#{Rails.root}/spec/fixtures/Panel2.png"
  end

  within_fieldset("Right Bottom") do
    fill_in "Title", :with => "Panel 3"
    fill_in "Url", :with => "panel-3"
    attach_file "Panel", "#{Rails.root}/spec/fixtures/turkey-shootout-champs.png"
  end
end

Then /^they will show up on the homepage$/ do
  visit "/"
  page.should have_content("Panel 1")
  page.should have_content("Panel 2")
  page.should have_content("Panel 3")
end

Then /^they will be saved$/ do
  page.should have_content("Panels sucessfully updated.")
end

Then /^it will be saved$/ do
  page.should have_content("Panels sucessfully updated.")
end

When /^I add one new panel$/ do
  within_fieldset("Left") do
    fill_in "Title", :with => "Panel 4"
    fill_in "Url", :with => "panel-4"
    attach_file "Panel", "#{Rails.root}/spec/fixtures/winter-clinics.png"
  end
end

Then /^it will show up on the homepage$/ do
  visit "/"
  page.should have_content("Panel 4")
end

Then /^the existing panels will still be in place$/ do
  page.should have_content("Panel 2")
  page.should have_content("Panel 3")
end

When /^I add one new panel with missing information$/ do
  within_fieldset("Left") do
    fill_in "Title", :with => ""
    fill_in "Url", :with => ""
    attach_file "Panel", ""
  end
end

Then /^I will receive errors$/ do
  page.should have_content("prohibited this panel from being saved:")
end

When /^I add new panels with missing information$/ do
  within_fieldset("Left") do
    fill_in "Title", :with => ""
    fill_in "Url", :with => ""
    attach_file "Panel", ""
  end

  within_fieldset("Right Top") do
    fill_in "Title", :with => ""
    fill_in "Url", :with => ""
    attach_file "Panel", ""
  end

  within_fieldset("Right Bottom") do
    fill_in "Title", :with => ""
    fill_in "Url", :with => ""
    attach_file "Panel", ""
  end
end
