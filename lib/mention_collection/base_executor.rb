module MentionCollection
  class BaseExecutor
    class << self
      delegate :run, to: :new

      def task_name
        name.underscore.gsub(%r{\m_crawler\/}, "")
      end
    end

    def run
      run_process
    end

    def default_limit
      1000
    end

    def task_name
      self.class.task_name
    end

    def once_exec_limit
      return @once_exec_limit if @once_exec_limit

      task_lock = TaskLock.find_by(key: task_name)
      @once_exec_limit = task_lock&.once_exec_limit.blank? ? default_limit : task_lock.once_exec_limit
      @once_exec_limit
    end

    private

    def run_process
      raise NotImplementedError, "継承先で定義すること"
    end
  end
end
