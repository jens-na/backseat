module Backseat

  class ChannelExec < Channel

    def initialize(name)
      super(name)
    end

    def exec
      puts 'todo: execute'
    end
  end
end
