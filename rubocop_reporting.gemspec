
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubocop_reporting/version'

Gem::Specification.new do |spec|
  spec.authors       = ['Yoga Hapriana']
  spec.email         = ['thenelse@rocketmail.com']
  spec.description   = 'Rubocop reporting description'
  spec.summary       = 'Rubocop reporting summary'
  spec.homepage      = 'http://www.rubocop-reporting.com'
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ['rubocop_reporting']
  spec.name          = 'rubocop_reporting'
  spec.version       = RubocopReporting::VERSION
  spec.license       = 'MIT'
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end
  spec.bindir        = 'bin'
  spec.require_paths = ['lib']
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'magic_frozen_string_literal', '~> 1.0.1'
  spec.add_development_dependency 'rails_best_practices', '~> 1.19.1'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.53.0'
end
