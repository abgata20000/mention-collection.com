create_table :issues, comment: "issue", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
  t.belongs_to :user, null: false, comment: "ユーザー"
  t.integer :service_type_id, null: false, comment: "サービスID(githubとか)"
  t.string :repository_full_name, comment: "リポジトリ名(アカウント込み)"
  t.string :repository_name, comment: "リポジトリ名"
  t.string :key, comment: "固有キー情報"
  t.string :url, comment: "URL"
  t.string :title, comment: "タイトル"
  t.text :body, comment: "内容"
  t.string :create_user_name, comment: "作成者名"
  t.string :create_user_image, comment: "作成者の画像URL"
  t.timestamps

  t.index :service_type_id
  t.index :repository_name
  t.index :repository_full_name
  t.index :key
  t.index :create_user_name
end
