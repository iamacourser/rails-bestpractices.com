Factory.define :question do |q|
  q.sequence(:title) {|n| "Question #{n}" }
  q.body "subject\n=======\ntitle\n-----"
  q.association :user
end

Factory.define :code_question, :parent => :question do |q|
  q.sequence(:title) {|n| "Code Question #{n}" }
  q.body "subject\n=======\ntitle\n-----\n    def test\n      puts 'test'\n    end"
  q.association :user
end
