# == Schema Information
#
# Table name: mentions
#
#  id                         :bigint(8)        not null, primary key
#  checked_at(todoのチェックつけた時間) :datetime
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  comment_id(issue)          :bigint(8)        not null
#  user_id(ユーザー)              :bigint(8)        not null
#
# Indexes
#
#  index_mentions_on_checked_at  (checked_at)
#  index_mentions_on_comment_id  (comment_id)
#  index_mentions_on_user_id     (user_id)
#

class Mention < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  default_value_for :url, ""

  class << self
    private

    def mentions_search(comment)
      tmp = comment.scan(%r{@[\w\-\/]+})
      mentions = []
      tmp.each { |mention| mentions << mention.delete("@") }
      mentions
    end
  end
end
