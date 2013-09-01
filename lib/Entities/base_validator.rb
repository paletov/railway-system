class BaseValidator < ActiveModel::Validator
  def validate_presence(member, member_name, model)
    if member == nil
      model.errors[member_name.to_sym] << "The #{member_name} is required"
      false
    else true
    end
  end

  def validate_type(member, member_name, expectedType, expected_type_name, model)
    if member != nil && !member.is_a?(expectedType)
      model.errors[member_name.to_sym] << "The #{member_name} must be #{expected_type_name}"
      false
    else true
    end
  end
end