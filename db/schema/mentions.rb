create_table :mentions, comment: "メンション情報", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
  t.belongs_to :user, null: false, comment: "ユーザー"
  t.belongs_to :comment, null: false, comment: "issue"
  t.datetime :checked_at, comment: "todoのチェックつけた時間"
  t.timestamps

  t.index :checked_at
end
