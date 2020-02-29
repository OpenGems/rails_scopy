# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_scopy/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_scopy'
  spec.version       = RailsScopy::VERSION
  spec.authors       = ['Boris BRESCIANI']
  spec.email         = ['boris2bresciani@gmail.com']

  spec.summary       = 'Generate automatically scopes in your model'
  spec.description   = 'Generate automatically scopes in your model (PostgreSQL, SQLite, MySQL, etc...)'
  spec.homepage      = 'https://github.com/OpenGems/rails_scopy'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activerecord', '>= 5.2', '< 7'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'coveralls', '~> 0.8'
  spec.add_development_dependency 'faker', '~> 2.10'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.16'
  spec.add_development_dependency 'pg', '~> 1.2'
end
