Factory.define :answer do |p|
  p.association :user
  p.association :question
  p.body 'answer'
end
