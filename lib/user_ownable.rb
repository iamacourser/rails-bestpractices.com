module UserOwnable

  def self.included(base)
    base.class_eval do
      belongs_to :user
    end
  end

  def belongs_to?(user)
    user && user_id == user.id
  end

end
