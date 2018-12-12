create_table :mention_keys, comment: "メンションするユーザー名を管理する", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
  t.belongs_to :user, null: false, comment: "ユーザー"
  t.integer :service_type_id, null: false, comment: "サービスID(githubとか)"
  t.string :username, null: false, comment: "メンションするユーザー名"
  t.timestamps

  t.index :service_type_id
  t.index :username
end
