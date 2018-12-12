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

FactoryBot.define do
  factory :mention do
    comment { "@aragaki レビューお願いします。" }
    url { "https://github.com/abgata20000/mention-collection.com/pull/5" }
  end
end
