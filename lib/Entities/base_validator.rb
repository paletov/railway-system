class BaseValidator < ActiveModel::Validator
  def validate_presence(member, memberName, model)
    if member == nil
      model.errors[memberName.to_sym] << "The #{memberName} is required"
      false
    else true
    end
  end

  def validate_type(member, memberName, expectedType, expectedTypeName, model)
    if member != nil && !member.is_a?(expectedType)
      model.errors[memberName.to_sym] << "The #{memberName} must be #{expectedTypeName}"
      false
    else true
    end
  end
end