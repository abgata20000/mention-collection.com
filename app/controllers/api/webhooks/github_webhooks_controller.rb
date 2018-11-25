module Api
  module Webhooks
    class GithubWebhooksController < ApplicationController
      before_action :set_mention_user_ids, only: %w[create]

      def create
        @mention_user_ids.each do |user_id|
          @mention = Mention.new(mention_params)
          @mention.user_id = user_id
          @mention.save
        end
        head :ok
      end

      private

      def mention_params
        mention_params = {}
        mention_params[:comment] = params[:comment][:body]
        mention_params[:url] = params[:comment][:html_url]
        mention_params
      end

      def set_mention_user_ids
        @mention_user_ids = Mention.mention_user_ids(params[:comment][:body])
      end
    end
  end
end
