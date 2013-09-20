module Backseat

  class NotifyRss

    # Initialize the class
    # Args:
    #   output_file: Output file
    #   author: The author of the RSS feed
    #   title: The RSS feed title
    #   max: The maximum number of entries in the RSS feed
    def initialize(output_file, author, title, max)
      @output_file = output_file
      @author = author
      @title = title
    end

    # Adds an entry to the existing rss feed
    # Args:
    #   Link: The link to display
    #   Text: The text to display in the new feed
    def add(link, text)
      raise NotImplementedError
    end
  end
