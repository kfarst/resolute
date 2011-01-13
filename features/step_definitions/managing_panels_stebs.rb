When /^I add three new panels$/ do
  with_scope("") do
  end

  with_scope("") do
  end

  with_scope("") do
  end
end

Then /^they will show up on the homepage$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I add one new panel$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it will show up on the homepage$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the existing panels will still be in place$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I add one new panel with missing information$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I will receive errors$/ do
  page.should have_content("prohibited this panel from being saved:")
end

When /^I add new panels with missing information$/ do
  pending # express the regexp above with the code you wish you had
end
