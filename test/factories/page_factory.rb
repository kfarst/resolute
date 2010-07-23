Factory.define :page do |p|
  p.type 'Page'
  p.title 'Test Page Title'
  p.body  'Test Page Body'
  p.association :category
end

