module Backseat

  class Backup
    include Comparable
    
    def initialize(filename, time)
      @filename = filename
      @time = time
    end

    # Returns 1 if other backup object is greater. 
    def<=>(other)
      return @time <=> other.time
    end

    attr_reader :filename, :time
  end
end
