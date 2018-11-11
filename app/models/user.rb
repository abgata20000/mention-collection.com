# == Schema Information
#
# Table name: users
#
#  id                          :bigint(8)        not null, primary key
#  email(メールアドレス)              :string(255)      not null
#  enabled(有効・無効)              :boolean          default(TRUE), not null
#  ip(IP)                      :string(255)
#  last_logged_in_at(最終ログイン時間) :datetime
#  memo(メモ)                    :text(65535)
#  name(ユーザー名)                 :string(255)
#  nickname(ユーザー名(ニックネーム))     :string(255)
#  role(権限)                    :integer          default("user"), not null
#  token(トークン)                 :string(255)
#  user_agent(UA情報)            :text(65535)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_users_on_email              (email) UNIQUE
#  index_users_on_last_logged_in_at  (last_logged_in_at)
#  index_users_on_role               (role)
#  index_users_on_token              (token) UNIQUE
#  index_users_on_updated_at         (updated_at)
#

class User < ApplicationRecord
  enumerize :role, in: {
    guest: 0,
    user: 1,
    premium_user: 2,
    manager: 9,
    admin: 10,
    ban_user: 99
  }, scope: true

  after_initialize :generate_token

  def logout; end

  def login; end

  private

  def generate_token
    self.token = SecureRandom.hex(32) if token.blank?
  end
end
