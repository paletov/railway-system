require 'user'
require 'user_repository'
require 'session_manager'
require 'credentials'

class AuthenticationController
  def login(credentials)
    user = UserRepository.where(:name = credentials.name, :password = credentials.password)
    if user != nil then SessionManager.create_session(user.id)
  end

  def logout(session)
    SessionManager.destroy(session)
  end
end