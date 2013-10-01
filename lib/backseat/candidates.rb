module Backseat

  require 'pathname'

  class Candidates

    # The constructor for the candidates with the specified
    # config directory.
    def initialize(cfgdir) 
      @cfgdir = cfgdir
      unless cfgdir.end_with?('/')
        @cfgdir = @cfgdir + '/'
      end
    end

    # Returns the candidates which are linked in the directory
    # cfgdir.
    def get_candidates
      candidates = Array.new

      Dir.entries(@cfgdir).each do |f|
        next if f == '..'
        next if f == '.'
        dir = @cfgdir + f
        realpath = Pathname.new(dir).realpath.to_s

        if File.directory?(realpath)
          name = File.basename(f)
          candidates.push(Candidate.new(name, realpath))
        end
      end
      return candidates
    end

    # Returns a candidate object with the specified candidate
    # name.
    def get_candidate(name)
      Dir.entries(@cfgdir).each do |f|
        next if f == '..'
        next if f == '.'

        dir = @cfgdir + f
        realpath = Pathname.new(dir).realpath.to_s
        basename = File.basename(f)
 
        if basename == name && File.directory?(realpath) 
          return Candidate.new(name, realpath)
        end 
        return nil
      end
    end

    attr_reader :cfgdir
  end
end
