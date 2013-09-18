module Backseat

  # The API for the backup utilities
  class Backup

    # The constructor for the backup class
    # Params:
    #   root - the root directory where the backups are stored
    def initialize(root)
      @root = root
    end

    # The backup identifier.
    # Example: "rsnapshot"
    def get_identifier
      raise NotImplementedError
    end

    # The most recent backup available.
    # Example: daily.0
    def get_recent
      raise NotImplementedError
    end

    # Returns a list of available backups in the root directory.
    # Example: daily.0, daily.1, ...
    def get_backups
      raise NotImplementedError
    end
  end
end
