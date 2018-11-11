create_table :task_locks, comment: "タスク管理", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", force: :cascade do |t|
  t.string :key, null: false, comment: "管理用のキー(ユニーク)"
  t.string :name, comment: "タスク名"
  t.integer :exec_block_count, default: 0, comment: "ロック中に叩かれてブロックされた回数"
  t.integer :exec_count, default: 0, comment: "累計実行回数"
  t.integer :block_limit_count, default: 0, comment: "何回ブロックされたらロックを解除するかの回数"
  t.datetime :last_executed_at, comment: "最終実行日時"
  t.boolean :locking, default: false, comment: "ロック中の判定"
  t.text :memo, comment: "メモ"
  t.integer :once_exec_limit, comment: "1回の実行で処理する件数"
  t.timestamps
  #
  t.index :key, unique: true
end
