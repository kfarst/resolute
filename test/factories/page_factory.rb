Factory.define :page, :class => 'Item' do |p|
  p.type 'Page'
  p.title 'Test Page Title'
  p.body  'Test Page Body'
  p.association :category_id, :factory => :category
end

