Factory.define :camp   do
  sequence :name do |n|
    "Test Camp #{n}"
  end

  start_at    Time.now
  end_at      3.days.from_now
  description "This is a test camp."
  location    "6000 Cooper Road Columbus, OH 43210"
  group       "High School"
  cost        100.00
  payment_url "https://www.paypal.com/test"
end
