require 'user'
require 'user_repository'

class UserController
  def create_or_update(user)
    if user.valid? then UserRepository.save(user)
    end
  end

  def get_users(filter = {})
    filter[:is_deleted] = false
    UserRepository.where(filter)
  end

  def delete_user(id)
    user = UserRepository.where(:id => id)
    user.is_deleted = true
    UserRepository.save(user)
  end
end