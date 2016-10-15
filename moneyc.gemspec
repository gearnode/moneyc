lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'moneyc/version'

Gem::Specification.new do |gem|
    gem.name          = 'moneyc'
    gem.version       = Moneyc::VERSION
    gem.authors       = %w(Bryan FRIMIN)
    gem.email         = %w(bfrimin@student.42.fr)
    gem.description   = 'Convert your currency with simple lib'
    gem.summary       = 'Convert et retrive rate of your currency with simple lib'
    gem.homepage      = 'https://github.com/gearnode/moneyc'
    gem.license       = 'MIT'

    gem.required_ruby_version     = '>= 2.2'
    gem.required_rubygems_version = '>= 1.8.11'

    gem.files         = `git ls-files`.split($/)
    gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
    gem.test_files    = gem.files.grep(%r{^(spec)/})
    gem.require_paths = ['lib']

    gem.add_development_dependency 'rake', '~> 11.3', '>= 10.4'
    gem.add_development_dependency 'bundler', '~> 1.7'
    gem.add_development_dependency 'rspec', '~> 3.1'
    gem.add_development_dependency 'pry', '~> 0.10'
    gem.add_development_dependency 'timecop'
    gem.add_development_dependency 'codeclimate-test-reporter'
end
