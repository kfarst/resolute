Factory.define :product do
  sequence :name do |n|
    "Test Product #{n}"
  end

  url "http://www.example.com/test-product"
  price 12.00
  size "Small,Medium,Large"
end
