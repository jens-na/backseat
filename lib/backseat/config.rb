module Backseat

  class Config
    
    def initialize(file)
      @file = file
    end

    # check the configuration file and throw exceptions if there
    # are any problems 
    def check
      raise Exception.new("File name  is nil") if @file == nil
      raise Exception.new("File #{@file} does not exist") unless File.exists?(@file)

      @cfg = YAML.load_file(@file)
      candidates = @cfg['candidates']

      candidates.each do |name,value|
        root = @cfg['candidates'][name]['root']
        
        notifications = @cfg['candidates'][name]['notifications']
        nobackup = notifications['nobackup']
        newbackup = notifications['newbackup']

        if root == nil
          raise Exception.new("Root dir not specified for #{root}.")
        end

        unless File.exists?(root)
          raise Exception.new("Backup folder #{root} for candidate #{name} "\
                              "does not exist.")
        end

        if nobackup != nil
          raise Exception.new("#{name}: Expire time in days < 1 or not specified for "\
                                        "notification nobackup.") if nobackup['expire'] == nil ||
                                                                     nobackup['expire'] < 1

          raise Exception.new("#{name}: No via specified for notification nobackup.") if 
                                             nobackup['via'] == nil ||
                                             nobackup['via'].length == 0
        end

        if newbackup != nil
          raise Exception.new("#{name}: No via specified for notification newbackup.") if 
                                             newbackup['via'] == nil ||
                                             newbackup['via'].length == 0
        end
      end
    end

    attr_reader :cfg, :file

  end
end
