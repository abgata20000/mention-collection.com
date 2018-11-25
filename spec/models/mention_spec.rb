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
