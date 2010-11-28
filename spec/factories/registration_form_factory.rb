Factory.define :registration_form do |r|
  r.name false
  r.age false
  r.school false
  r.position false
  r.email false
  r.phone false
  r.address false
  r.grade false
  r.yrs_of_exp false
  r.finding_resolute false
  r.comments false
  r.association :camp
end
