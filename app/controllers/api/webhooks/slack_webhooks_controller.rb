module Api
  module Webhooks
    class SlackWebhooksController < ApplicationController
      before_action :set_mention_user_ids, only: %w[create]

      def create
        @mention_user_ids.each do |user_id|
          @mention = Mention::ForSlack.new(mention_params)
          @mention.user_id = user_id
          @mention.save
        end
        head :ok
      end

      private

      def mention_params
        mention_params = {}
        mention_params[:comment] = params[:text]
        mention_params
      end

      def set_mention_user_ids
        @mention_user_ids = Mention::ForSlack.mention_user_ids(params[:text])
      end
    end
  end
end
