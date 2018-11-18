# == Schema Information
#
# Table name: mentions
#
#  id            :bigint(8)        not null, primary key
#  comment(コメント) :text(65535)      not null
#  url(url)      :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :text(65535)      not null
#

class Mention < ApplicationRecord
  belongs_to :user

  class << self
    def mention_user_ids(comment)
      user_names = mention_user_names(comment)
      User.where(name: user_names).ids
    end

    private

    def mentions_search(comment)
      tmp = comment.scan(%r{@[\w\-\/]+})
      mentions = []
      tmp.each { |mention| mentions << mention.delete("@") }
      mentions
    end

    def mention_user_names(comment)
      names = User.all.map(&:name)
      mentions = mentions_search(comment)
      mention = names & mentions
      mention
    end
  end
end
