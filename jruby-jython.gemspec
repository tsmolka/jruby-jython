# coding: utf-8
raise("JRuby required") unless defined?(JRUBY_VERSION)

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jython/version'

Gem::Specification.new do |spec|
  spec.name          = 'jruby-jython'
  spec.version       = Jython::VERSION
  spec.date          = Time.now.strftime('%Y-%m-%d')
  spec.authors       = ['Tobias']
  spec.email         = ['tsmolka@gmail.com']
  spec.licenses      = ['Apache-2.0']
  
  spec.summary       = %q{ Jython for JRuby }
  spec.description   = %q{ Embeds jython-standalone.jar and few wrappers into single Ruby module }
  spec.homepage      = 'https://github.com/tsmolka/jruby-jython'

  #spec.platform      = 'java'
  spec.files         = (`git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|jython)/}) }) + ['dist/jython-standalone.jar']
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'jruby-openssl'
  spec.add_development_dependency 'cucumber'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'  
end
