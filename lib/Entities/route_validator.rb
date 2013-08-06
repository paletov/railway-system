require 'base_validator'

class RouteValidator < BaseValidator
  def validate(route)
    valid = true
    valid &= validate_name(route)
    valid &= validate_company_name(route)
    valid
  end

  def validate_name(route)
    if !validate_presence(route.name, "name", route) then false
    elsif !validate_type(route.name, "name", String, "String", route) then false
    else true
    end
  end

  def validate_company_name(route)
    if !validate_presence(route.company_name, "company_name", route) then false
    elsif !validate_type(route.company_name, "company_name", String, "String", route) then false
    else true
    end
  end
end