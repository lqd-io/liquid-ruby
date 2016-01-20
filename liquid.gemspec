# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'liquid/version'

Gem::Specification.new do |spec|
  spec.name          = 'liquid-ruby'
  spec.version       = Liquid::VERSION
  spec.authors       = ['Ricardo Leitao']
  spec.email         = ['rleitao@onliquid.com']

  spec.summary       = 'Ruby wrapper for the Liquid API'
  spec.description   = 'Ruby wrapper for the Liquid API (https://onliquid.com)'
  spec.homepage      = 'https://github.com/lqd-io/liquid-ruby'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'rest-client', '~> 1.8.0'
  spec.add_dependency 'json'
end
