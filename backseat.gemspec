$:.push File.expand_path("../lib", __FILE__)
require "backseat/version"

Gem::Specification.new do |s|
  s.name        = "backseat"
  s.version     = Backseat::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jens Nazarenus"]
  s.email       = ["jens@0x6a.de"]
  s.homepage    = ""
  s.summary     = %q{Backup observer}
  s.description = %q{An observer for network based backups.}

  s.add_runtime_dependency "launchy"
  s.add_development_dependency "rspec", "~>2.5.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
