
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "atom_shortcuts/version"

Gem::Specification.new do |spec|
  spec.name          = "atom_shortcuts"
  spec.version       = AtomShortcuts::VERSION
  spec.authors       = ["atxrenegade"]
  spec.email         = ["harleighabel@gmail.com"]

  spec.summary       = "A Cli gem for quick reference to Atom Shortcuts"
  spec.description   = "A quick CLI reference to Atom shortcuts for Mac, Windows and Linux, with search function"
  spec.homepage      = "https://github.com/atxrenegade/flatiron_ruby_cli_portfolio"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #   "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.8"
  spec.add_development_dependency 'pry', '~> 0.11.3'
  spec.add_development_dependency 'require_all', '~> 1.3', '>= 1.3.3'

end
