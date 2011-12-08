Factory.define :category do
  type 'Category'

  sequence :title do|n| 
    "Test Category Title #{n}"
  end

  body  'Test Category Body'
end
