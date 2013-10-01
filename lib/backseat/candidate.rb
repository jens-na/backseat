module Backseat

  class Candidate

    def initialize(name, root)
      @name = name
      @root = root
      @expire = 3
    end

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

    def get_latest_backup
      backups = get_backups
      return backups.last
    end

    def get_backups
      backups = Array.new

      Dir.entries(@root).sort_by{|a| File.stat(@root + a).mtime}.each do |f|
        next if f == '.' or f == '..'

        backup = Backup.new(@root + f, File.mtime(@root + f))
        backups.push(backup)
      end
      return backups
    end
    attr_reader :name, :root
  end
end
