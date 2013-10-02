module Backseat

  class Channels

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
    end

    def get_exec
    end
  end
end
