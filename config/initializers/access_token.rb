# Hack authlogic-connect
class AccessToken
  after_create :update_profile

  private
    def update_profile
      user.update_profile
    end
end
