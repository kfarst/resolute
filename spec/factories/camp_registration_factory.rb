Factory.define :camp_registration do |r|
  r.name              "John Smith"
  r.email             "example@example.com"
  r.age               17
  r.position          "Attack, Goalie"
  r.school            "James Woods High School"
  r.phone             "(483) 394-2393"
  r.street_address    "123 Fake Street"
  r.city              "Columbus"
  r.state             "OH"
  r.zip               48304
  r.grade             11
  r.yrs_of_exp        3
  r.finding_resolute  "Google"
  r.association :registration_form
end
