# frozen_string_literal: true
class ActionDispatch::Routing::Mapper
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end
end

Rails.application.routes.draw do
  root to: "static_pages#top"
  resource :sessions, only: %w(create destroy)
  get "signin", to: "sessions#new"
  get "sessions", to: "sessions#new"
  #
  draw :api
  # draw :admins
end

# == Route Map
#
#                       Prefix Verb   URI Pattern                                                                              Controller#Action
#                         root GET    /                                                                                        static_pages#top
#                     sessions DELETE /sessions(.:format)                                                                      sessions#destroy
#                              POST   /sessions(.:format)                                                                      sessions#create
#                       signin GET    /signin(.:format)                                                                        sessions#new
#                              GET    /sessions(.:format)                                                                      sessions#new
# api_webhooks_github_webhooks POST   /api/webhooks/github_webhooks(.:format)                                                  api/webhooks/github_webhooks#create
#  api_webhooks_slack_webhooks POST   /api/webhooks/slack_webhooks(.:format)                                                   api/webhooks/slack_webhooks#create
#           rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#    rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#           rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#    update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#         rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
