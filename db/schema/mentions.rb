create_table :mentions, comment: 'メンション情報', options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
  t.belongs_to :user, null: false
  t.text :comment, null: false, comment: 'コメント'
  t.string :url, null: false, comment: 'url'
  t.timestamps
end
