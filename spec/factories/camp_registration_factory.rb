Factory.define :camp_registration do
  name              "John Smith"
  email             "example@example.com"
  age               17
  position          "Attack, Goalie"
  school            "James Woods High School"
  phone             "(483) 394-2393"
  street_address    "123 Fake Street"
  city              "Columbus"
  state             "OH"
  zip               48304
  grade             11
  yrs_of_exp        3
  finding_resolute  "Google"
  comments          "This is a test comment."
  association :registration_form
end
