# == Schema Information
#
# Table name: mention_keys
#
#  id                                :bigint(8)        not null, primary key
#  username(メンションするユーザー名)            :string(255)      not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  service_type_id(サービスID(githubとか)) :integer          not null
#  user_id(ユーザー)                     :bigint(8)        not null
#
# Indexes
#
#  index_mention_keys_on_service_type_id  (service_type_id)
#  index_mention_keys_on_user_id          (user_id)
#  index_mention_keys_on_username         (username)
#

class MentionKey < ApplicationRecord
  belongs_to :user
  belongs_to :service_type
end
