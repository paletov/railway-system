class Session
  attr_reader :session_id, :user_id

  def initialize(session_id, user_id)
    @session_id = session_id
    @user_id = user_id
  end
end