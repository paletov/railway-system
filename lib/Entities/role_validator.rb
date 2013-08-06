require 'base_validator'

class RoleValidator < BaseValidator
  def validate(role)
    valid = true
    valid &= validate_name(role)
    valid
  end

  def validate_name(role)
    if !validate_presence(role.name, "name", role) then false
    elsif !validate_type(role.name, "name", String, "String", role) then false
    else true
    end
  end
end