require "rails_helper"

Dir[Rails.root.join("spec/requests/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include Requests::SigninMacros, type: :request
end
