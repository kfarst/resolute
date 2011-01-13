Factory.define :panel do |p|
  p.sequence(:title) {|n| "Panel #{n}"}
  p.position "Left"
  p.url "panel"
end
