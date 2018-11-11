class UserSession < ActiveType::Object
  attribute :username, :string

  validates :username, presence: true
end
