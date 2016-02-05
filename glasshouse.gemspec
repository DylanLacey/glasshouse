# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'glasshouse/version'

Gem::Specification.new do |spec|
  spec.name          = "glasshouse"
  spec.version       = Glasshouse::VERSION
  spec.authors       = ["Dylan Lacey"]
  spec.email         = ["github@dylanlacey.com"]

  spec.summary       = "Grow delicate code in a managed ENVironment"
  spec.description   = "Glasshouse lets you #plant and #prune values from the
  ENV hash for specific blocks of code.  It's great for testing or lightweight
  sandboxing of code."
  spec.homepage      = "http://www.rubygems.org/dylanlacey/glasshouse"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
