module Backseat

  class Backup
    
    def initialize(filename, time)
      @filename = filename
      @time = time
    end

    attr_reader :filename, :time
  end
end
