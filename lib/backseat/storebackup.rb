module Backseat

  class Storebackup < Backuptool
    
    def initialize(root)
      super(root)
    end

    def get_identifier
      return "storebackup" 
    end

    def get_recent
    end

    def get_backups
      backups = Array.new
      Dir.foreach(@root) do |item|
      next if item == '.' or item == '..'
        backups.push(item)  
      end
    end
  end
end
