# == Schema Information
#
# Table name: comments
#
#  id                            :bigint(8)        not null, primary key
#  body(内容)                      :string(255)
#  key(コメントを特定できるキー情報)           :string(255)
#  sender_image(コメント登録ユーザー画像URL) :string(255)
#  sender_name(コメント登録ユーザー名)      :string(255)
#  url(URL)                      :string(255)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  issue_id(issue)               :bigint(8)        not null
#  user_id(ユーザー)                 :bigint(8)        not null
#
# Indexes
#
#  index_comments_on_issue_id     (issue_id)
#  index_comments_on_key          (key)
#  index_comments_on_sender_name  (sender_name)
#  index_comments_on_user_id      (user_id)
#

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :issue
end
