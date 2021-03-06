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
  belongs_to :user

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
