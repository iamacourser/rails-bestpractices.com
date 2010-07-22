Factory.define :vote do |p|
  p.association :user
  p.association :post
  p.like { [false,true].rand }
end
