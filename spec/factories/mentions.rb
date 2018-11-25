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

FactoryBot.define do
  factory :mention do
    comment { "@aragaki レビューお願いします。" }
    url { "https://github.com/abgata20000/mention-collection.com/pull/5" }
  end
end
