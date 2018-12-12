class ActiveTypeRecord < ActiveType::Object
  def show_attributes
    attributes
  end

  def show_errors
    errors.full_messages
  end
end
