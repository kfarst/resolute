Factory.define :camp   do |c|
  c.sequence(:name) {|n| "Test Camp #{n}"}
  c.start_at    Time.now
  c.end_at      3.days.from_now
  c.description "This is a test camp."
  c.sequence(:location) {|n| "#{n} Cooper Road Columbus, OH 43210"}
  c.group       "High School"
  c.cost        100.00
end
