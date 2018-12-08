require "requests/spec_helper"

describe "POST /api/webhooks/slack_webhooks", type: :request do
  let!(:user) { create(:user) }
  let(:path) { "/api/webhooks/slack_webhooks" }
  let(:params) { attributes_for(:mention).to_json }

  it "true が返ってくる" do
    post path, params: params
    expect(response).to be_truthy
  end
end
