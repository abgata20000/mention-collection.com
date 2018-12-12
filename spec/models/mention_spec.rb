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

require "rails_helper"

RSpec.describe Mention, type: :model do
  let!(:user) { create(:user) }
  let(:mention) { build(:mention, user: user) }
  subject { mention.save }

  describe "#create" do
    it "保存が成功すること" do
      expect(subject).to be_truthy
    end

    it "Mentionが増えること" do
      expect { subject }.to change(Mention, :count).by(1)
    end
  end
end
