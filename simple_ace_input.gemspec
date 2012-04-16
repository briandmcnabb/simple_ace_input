$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_ace_input/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_ace_input"
  s.version     = SimpleAceInput::VERSION
  s.authors     = ["Brian McNabb"]
  s.email       = ["brian@new-cartographers.com"]
  s.homepage    = "new-cartographers.com"
  s.summary     = "Turns a simple_form textarea into an ACE editor."
  s.description = "Turns a simple_form textarea into an ACE editor."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.1"
  s.add_dependency "simple_form", "~> 2.0"
end
