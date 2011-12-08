Factory.define :panel do
  sequence :title do |n| 
    "Panel #{n}"
  end

  position "Left"
  url "panel"
end
