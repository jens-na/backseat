module Backseat

  class ChannelRss < Channel

    def initialize(name)
      super(name)
    end

    def exec
      puts 'todo: rss feed'
    end
  end
end
