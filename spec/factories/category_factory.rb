Factory.define :category do |p|
  p.type 'Category'
  p.sequence(:title) {|n| "Test Category Title #{n}"}
  p.body  'Test Category Body'
end
