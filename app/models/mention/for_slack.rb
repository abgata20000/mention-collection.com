# == Schema Information
#
# Table name: mentions
#
#  id            :bigint(8)        not null, primary key
#  comment(コメント) :text(65535)      not null
#  url(url)      :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint(8)        not null
#
# Indexes
#
#  index_mentions_on_user_id  (user_id)
#

class Mention < ApplicationRecord
  class ForSlack < ActiveType::Record[Mention]

    class << self
      def mention_user_ids(comment)
        user_slack_ids = mention_slack_ids(comment)
        User.where(slack_id: user_slack_ids).ids
      end

      private

      def mentions_search(comment)
        tmp = comment.scan(%r{@[\w\-\/]+})
        mentions = []
        tmp.each { |mention| mentions << mention.delete("@") }
        mentions
      end

      def mention_slack_ids(comment)
        slack_ids = User.all.map(&:slack_id)
        mentions = mentions_search(comment)
        mention = slack_ids & mentions
        mention
      end
    end
  end
end