# == Schema Information
#
# Table name: task_locks
#
#  id                                        :bigint(8)        not null, primary key
#  block_limit_count(何回ブロックされたらロックを解除するかの回数) :integer          default(0)
#  exec_block_count(ロック中に叩かれてブロックされた回数)      :integer          default(0)
#  exec_count(累計実行回数)                        :integer          default(0)
#  key(管理用のキー(ユニーク))                         :string           not null
#  last_executed_at(最終実行日時)                  :datetime
#  locking(ロック中の判定)                          :boolean          default(FALSE)
#  memo(メモ)                                  :text
#  name(タスク名)                                :string
#  once_exec_limit(1回の実行で処理する件数)             :integer
#  created_at                                :datetime         not null
#  updated_at                                :datetime         not null
#
# Indexes
#
#  index_task_locks_on_key  (key) UNIQUE
#

class TaskLock < ApplicationRecord
  default_value_for :exec_block_count, 0
  default_value_for :exec_count, 0
  default_value_for :block_limit_count, 30
  default_value_for :locking, false
  default_value_for :last_executed_at do
    Time.zone.now
  end

  validates :key, presence: true, uniqueness: true

  class << self
    def exec?(key)
      find_or_create_by(key: key).exec?
    end

    def do_unlock(key)
      find_or_create_by(key: key).do_unlock
    end
  end

  def do_lock
    update!(locking: true, exec_count: exec_count + 1, last_executed_at: Time.zone.now)
  end

  def do_unlock
    update!(locking: false, exec_block_count: 0)
  end

  def exec?
    if locking
      do_block
      false
    else
      do_lock
      true
    end
  end

  private

  def do_block
    if block_limit_count.positive? && block_limit_count <= exec_block_count
      do_unlock
    else
      update!(exec_block_count: exec_block_count + 1)
    end
  end
end
