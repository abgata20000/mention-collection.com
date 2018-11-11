module MentionCollection
  class TaskExecutor
    def initialize(task_name:)
      @task_name = task_name
    end

    # rubocop:disable Rails/Output
    def run
      is_exec = TaskLock.exec?(task_name)
      if is_exec
        yield
      else
        pp "他のプロセスが実行中です"
      end
      pp "done.(#{total_time}s)"
    rescue StandardError => e
      pp e
    ensure
      TaskLock.do_unlock(task_name) if is_exec
    end
    # rubocop:enable Rails/Output

    private

    attr_reader :task_name

    def start_time
      @start_time ||= Time.zone.now
    end

    def total_time
      end_time = Time.zone.now
      end_time - start_time
    end
  end
end
