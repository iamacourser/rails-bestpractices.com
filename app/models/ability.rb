class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    
    can :read, :all
    
    can :create, Comment
    
    can :create, Post
    can :update, Post do |post|
      post.belongs_to? user
    end
    
    can :create, Implementation
    can :update, Implementation do |implementation|
      implementation.belongs_to? user
    end
    
    can :create, Question
    can :update, Question do |question|
      question.belongs_to? user
    end
    
    can :create, Answer
    can :update, Answer do |answer|
      answer.belongs_to? user
    end
  end
end
