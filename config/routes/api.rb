# frozen_string_literal: true
namespace :api do
  namespace :webhooks do
    resources :github_webhooks, only: %w[create]
  end
end
