module Api
  module Webhooks
    class ApplicationController < ::ApplicationController
      protect_from_forgery with: :null_session
      skip_before_action :verify_authenticity_token
    end
  end
end
