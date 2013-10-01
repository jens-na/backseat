module Backseat

  class NotifyExec < Notify

    def initialize(executable)
      @executable = executable
    end

    def exec(args)
      raise NotImplementedError
    end
  end
end
