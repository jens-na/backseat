module Backseat

  class NotifyExec

    # Initializes the class with the executable as parameter.
    # Args:
    #   executable: The executable to call with the notification
    def initialize(executable)
      @executable = executable
    end

    # Calls the executable with the specified arguments
    # Args:
    #   args: the arguments as an Array
    def exec(args)
      raise NotImplementedError
    end
  end
end
