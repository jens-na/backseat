module Backseat

  require 'yaml'

  class Candidate

    def initialize(name, root)
      @name = name
      @root = root
      unless root.end_with?('/')
        @root = @root + '/'
      end
    end

    # Sets the candidate specific configuration file
    def set_config(cfgfile)
      @config = YAML.load_file(cfgfile)
    end

    # Actually check if the candidate is expired and
    # exec notification channels
    def check
      if @config == nil
        raise Exception.new("No candidate specific config file found for #{name}.") 
        return
      end

      newbackup = @config['notifications']['newbackup']
      nobackup = @config['notifications']['nobackup']

      if nobackup && nobackup['enabled']
        expire = nobackup['expire-days']
        channels = nobackup['channel']
        check_nobackup(expire, channels)
      end

      if newbackup && newbackup['enababled']
        puts newbackup
      end
    end

    # Returns true of the latest backup of the candidate
    # is older than N days.
    def expired?(days)
      if days != 0
        latest = get_latest_backup
        unless latest == nil
          time_now = Time.now.to_i - (60 * 60 * 24 * days)
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

    # Returns the latest backup
    def get_latest_backup
      backups = get_backups
      return backups.last
    end

    # Returns all backups of the candidate sorted after mtime.
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

    private

    # Checks if candidate is expired and sends to defined channels
    def check_nobackup(expire, channels=[])
      creator = Channels.new(@config)
      if expired?(expire)
        channels.each do |c|
          impl = creator.get(c)
          impl.exec
        end
      end
    end

    def check_newbackup(last_known)

    end
  end
end
