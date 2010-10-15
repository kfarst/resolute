Factory.define :product do |p|
  p.sequence(:name) {|n| "Test Product #{n}"}
  p.url "http://www.example.com/#{self.name.parameterize}"
  p.price 12.00
end
