Factory.define :product do |p|
  p.sequence(:name) {|n| "Test Product #{n}"}
  p.url "http://www.example.com/test-product"
  p.price 12.00
  p.size "Small,Medium,Large"
end
