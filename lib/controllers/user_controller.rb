require 'user'
require 'user_repository'

class UserController
  def create_or_update(user)
    if user.valid? then UserRepository.save(user)
    end
  end

  def get_users(filter = {})
    UserRepository.where(filter)
  end

  def delete_user(user_id)
  end
end