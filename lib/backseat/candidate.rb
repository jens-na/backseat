module Backseat

  class Candidate

    # Initializes a candidate with the name and the root directory
    # of the candidate which may be an absolute or an relative path.
    def initialize(name, root, expire)
      @name = name
      @root = root
      @expire = expire
    end
    
    # Checks if the candidate is expired. Which means that the latest
    # backup is older than @expire days.
    def expired?
      if @expire == 0
        latest = get_latest_backup
        unless latest == nil
          time_minus = Time.now - 60 * 60 * 24 * @expire
          time_backup = latest.time
        end
      end
      return false
    end

    # Returns the latest backups based on the mtime of the root direcotry
    # of the candidate.
    def get_latest_backup
      backups = get_backups

    end

    # Returns the backups of the candidate.
    def get_backups
      backups = Array.new

      Dir.foreach(@root) do |item|
      next if item == '.' or item == '..'
        file = @root + item
        time = File.mtime(file)

        backup = Backup.new(file, time)
        backups.push(backup)  
      end
      return backups
    end

    attr_reader :root, :name, :expire
  end
end
