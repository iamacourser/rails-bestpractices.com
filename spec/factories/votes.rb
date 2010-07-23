Factory.define :vote do |p|
  p.association :user
  p.association :post
  p.sequence(:like) {|n| [false,true][n%2] }
end
