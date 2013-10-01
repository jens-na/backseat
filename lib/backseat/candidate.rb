module Backseat

  class Candidate
    
    def initialize(name, root)
      @name = name
      @root = root
    end

    attr_reader :name, :root
  end
end
