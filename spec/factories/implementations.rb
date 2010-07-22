Factory.define :implementation do |p|
  p.association :user
  p.association :post
  p.body '(sample code)'
end
