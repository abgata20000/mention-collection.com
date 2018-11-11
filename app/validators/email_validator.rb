# rubocop:disable all
class EmailValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    return if value.blank?
    if /\A\S+@\S+\.\S+\z/.match?(value)
      if options[:not_duplication]
        scope = options[:scope] || object.class
        if scope.where("#{attribute}": value).first
          object.errors.add(attribute, :duplication_email)
          return false
        end
      elsif options[:exist]
        scope = options[:scope] || object.class
        unless scope.where("#{attribute}": value).first
          object.errors.add(attribute, :not_exist_email)
          return false
        end
      end
    else
      object.errors.add(attribute, :not_email)
      return false
    end
    true
  end
end
# rubocop:enable all
