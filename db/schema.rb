# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", comment: "active_storageのファイル管理用", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", comment: "active_storageのID管理用", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "task_locks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", comment: "タスク管理", force: :cascade do |t|
    t.string "key", null: false, comment: "管理用のキー(ユニーク)"
    t.string "name", comment: "タスク名"
    t.integer "exec_block_count", default: 0, comment: "ロック中に叩かれてブロックされた回数"
    t.integer "exec_count", default: 0, comment: "累計実行回数"
    t.integer "block_limit_count", default: 0, comment: "何回ブロックされたらロックを解除するかの回数"
    t.datetime "last_executed_at", comment: "最終実行日時"
    t.boolean "locking", default: false, comment: "ロック中の判定"
    t.text "memo", comment: "メモ"
    t.integer "once_exec_limit", comment: "1回の実行で処理する件数"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_task_locks_on_key", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC", comment: "ユーザー情報", force: :cascade do |t|
    t.string "email", null: false, comment: "メールアドレス"
    t.string "name", comment: "ユーザー名"
    t.string "nickname", comment: "ユーザー名(ニックネーム)"
    t.string "token", comment: "トークン"
    t.integer "role", default: 1, null: false, comment: "権限"
    t.boolean "enabled", default: true, null: false, comment: "有効・無効"
    t.datetime "last_logged_in_at", comment: "最終ログイン時間"
    t.text "memo", comment: "メモ"
    t.string "ip", comment: "IP"
    t.text "user_agent", comment: "UA情報"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["last_logged_in_at"], name: "index_users_on_last_logged_in_at"
    t.index ["role"], name: "index_users_on_role"
    t.index ["token"], name: "index_users_on_token", unique: true
    t.index ["updated_at"], name: "index_users_on_updated_at"
  end

end
