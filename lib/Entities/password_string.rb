require 'digest/sha1'

class PasswordString < Virtus::Attribute::String
  class EncryptedString < Virtus::Attribute::Writer::Coercible
    def coerce(value)
      Digest::SHA1.hexdigest(value) if valid?(value)
    end

    def valid?(value)
      value != nil && value.is_a?(String) && value.length > 3 && value.length < 63
    end
  end

  def self.writer_class(*)
    EncryptedString
  end
end