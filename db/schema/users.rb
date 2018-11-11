create_table :users, comment: 'ユーザー情報', options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
  t.string :email, null: false, comment: 'メールアドレス'
  t.string :name, null: true, comment: 'ユーザー名'
  t.string :nickname, null: true, comment: 'ユーザー名(ニックネーム)'
  t.string :token, null: true, comment: 'トークン'
  t.integer :role, null: false, default: 1, comment: '権限'
  t.boolean :enabled, null: false, default: true, comment: '有効・無効'
  t.datetime :last_logged_in_at, null: true, comment: '最終ログイン時間'
  t.text :memo, null: true, comment: 'メモ'
  t.string :ip, null: true, comment: 'IP'
  t.text :user_agent, null: true, comment: 'UA情報'
  t.timestamps
  #
  t.index :email, unique: true
  t.index :token, unique: true
  t.index :role
  t.index :last_logged_in_at
  t.index :updated_at
end
