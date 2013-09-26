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
      if @expire != 0
        latest = get_latest_backup
        unless latest == nil
          time_now = Time.now.to_i - (60 * 60 * 24 * @expire)
          time_latest = latest.time.to_i

          if time_now > time_latest
            return true
          else
            return false
          end
        end
      end
      return false
    end

    # Returns the latest backups based on the mtime of the root direcotry
    # of the candidate.
    def get_latest_backup
      backups = get_backups
      return backups.last
    end

    # Returns the backups of the candidate sorted by mtime.
    def get_backups
      backups = Array.new

      Dir.entries(@root).sort_by{|a| File.stat(@root + a).mtime}.each do |f|
        next if f == '.' or f == '..'

        backup = Backup.new(@root + f, File.mtime(@root + f))
        backups.push(backup)
      end
      return backups
    end

    attr_reader :root, :name, :expire
  end
end
