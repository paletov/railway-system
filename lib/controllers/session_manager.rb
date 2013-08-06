class SessionManager
  class << self
    @@sessions = {}

    def get_session(session_id)
      @@sessions[session_id]
    end

    def create_session(user_id)
      session_id = loop do
        token = SecureRandom.base64
        break token unless @@sessions.has_key?(token)
      end

      @@sessions[session_id] = Session.new(session_id, user_id)
      @@sessions[session_id]
    end

    def destroy_session(session)
      @@sessions.delete(session.session_id)
    end
  end
end