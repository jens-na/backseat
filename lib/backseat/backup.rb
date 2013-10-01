module Backseat

  class Backup
    
    def initialize(filename, time)
      @filename = filename
      @time = time
    end

    def get_name
      return File.basename(filename)
    end

    attr_reader :filename, :time
  end
end
