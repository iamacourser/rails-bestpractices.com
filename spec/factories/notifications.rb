Factory.define :notification do |n|
  n.association :user
  n.association :notifierable, :factory => :comment
  n.read false
end
