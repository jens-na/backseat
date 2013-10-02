module Backseat

  class Channels

    # Initializes the class with the configuration file which holds
    # the channel specific settings
    def initialize(config)
      @config = config
    end

    def get(name)
      if name == 'rss'
        return get_rss
      end
      if name == 'exec'
        return get_exec
      end
    end
      
    private

    def get_rss
      return ChannelRss.new('rss')
    end

    def get_exec
      return ChannelExec.new('exec')
    end
  end
end
