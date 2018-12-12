create_table :comments, comment: "コメント", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
  t.belongs_to :user, null: false, comment: "ユーザー"
  t.belongs_to :issue, null: false, comment: "issue"
  t.string :key, comment: "コメントを特定できるキー情報"
  t.string :url, comment: "URL"
  t.string :body, comment: "内容"
  t.string :sender_name, comment: "コメント登録ユーザー名"
  t.string :sender_image, comment: "コメント登録ユーザー画像URL"
  t.timestamps

  t.index :key
  t.index :sender_name
end
