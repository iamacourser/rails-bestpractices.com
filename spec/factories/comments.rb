Factory.define :comment do |p|
  p.association :user
  p.association :commentable, :factory => :post
  p.body '(sample comment)'
end
