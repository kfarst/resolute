Factory.define :user do |u|
  u.sequence(:email) {|n| "test#{n}@example.com"}
  u.password "test"
  u.password_confirmation "test"
end
