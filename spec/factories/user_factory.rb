Factory.define :user do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  password "test"
  password_confirmation "test"
end
