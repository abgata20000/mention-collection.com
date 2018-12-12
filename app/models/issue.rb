# == Schema Information
#
# Table name: issues
#
#  id                                    :bigint(8)        not null, primary key
#  body(内容)                              :text(65535)
#  create_user_image(作成者の画像URL)          :string(255)
#  create_user_name(作成者名)                :string(255)
#  key(固有キー情報)                           :string(255)
#  repository_full_name(リポジトリ名(アカウント込み)) :string(255)
#  repository_name(リポジトリ名)               :string(255)
#  title(タイトル)                           :string(255)
#  url(URL)                              :string(255)
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  service_type_id(サービスID(githubとか))     :integer          not null
#  user_id(ユーザー)                         :bigint(8)        not null
#
# Indexes
#
#  index_issues_on_create_user_name      (create_user_name)
#  index_issues_on_key                   (key)
#  index_issues_on_repository_full_name  (repository_full_name)
#  index_issues_on_repository_name       (repository_name)
#  index_issues_on_service_type_id       (service_type_id)
#  index_issues_on_user_id               (user_id)
#

class Issue < ApplicationRecord
  belongs_to :user
  belongs_to :service_type
end
