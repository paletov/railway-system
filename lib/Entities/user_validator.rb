require 'base_validator'
require 'password_string'

class UserValidator < BaseValidator
  def validate(user)
    valid = true
    valid &= validate_name(user)
    valid &= validate_password(user)
    valid &= validate_role_id(user)
    valid
  end

  def validate_name(user)
    if !validate_presence(user.name, "name", user) then false
    elsif !validate_type(user.name, "name", String, "String", user) then false
    else true
    end
  end

  def validate_password(user)
    if !validate_presence(user.password, "password", user) then false
    elsif !validate_type(user.password, "password", String, "String", user) then false
    else true
    end
  end

  def validate_role_id(user)
    if !validate_presence(user.role_id, "role_id", user) then false
    elsif !validate_type(user.role_id, "role_id", Integer, "Integer", user) then false
    else true
    end
  end
end