module Backseat

  class Rsnapshot < Backuptool
    
    def initialize(root)
      super(root)
    end

    def get_identifier
      return "rsnapshot" 
    end

    def get_recent
    end

    def get_backups
    end
  end
end
