module Backseat

  class NotifyRss < Notify

    def initialize(output_file, author, title, max)
      @output_file = output_file
      @author = author
      @title = title
    end

    def add(link, text)
      raise NotImplementedError
    end
  end
