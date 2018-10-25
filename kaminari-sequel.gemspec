# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kaminari/sequel/version'

Gem::Specification.new do |spec|
  spec.name          = 'kaminari-sequel'
  spec.version       = Kaminari::Sequel::VERSION
  spec.authors       = ['Alexander Zubkov']
  spec.email         = ['info@zubkov.info']

  spec.summary       = 'Kaminari Sequel adapter'
  spec.description   = 'kaminari-sequel lets your Sequel models be paginatable'
  spec.homepage      = 'https://github.com/sekrett/kaminari-sequel'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'sequel', '~> 5.0'
  spec.add_dependency 'kaminari-core', '~> 1.1.0'
  spec.add_dependency 'kaminari-actionview', '~> 1.1.0'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'sqlite3'
end
