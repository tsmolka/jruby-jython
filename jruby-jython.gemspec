# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jython/version'

Gem::Specification.new do |spec|
  spec.name          = 'jruby-jython'
  spec.version       = Jython::VERSION
  spec.authors       = ['Tobias']
  spec.email         = ['tsmolka@gmail.com']

  spec.summary       = %q{ jython for jruby }
  spec.description   = %q{ embeds Jython jar and few wrappers into single module }
  spec.homepage      = 'https://github.com/tsmolka/jruby-jython'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'java'
  
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
