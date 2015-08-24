lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'currency_converter/version'

Gem::Specification.new do |gem|
    gem.name          = "currency_converter"
    gem.version       = CurrencyConverter::VERSION
    gem.authors       = ["Bryan FRIMIN"]
    gem.email         = ["bfrimin@student.42.fr"]
    gem.description   = %q{...}
    gem.summary       = %q{...}
    gem.homepage      = "https://github.com/gearnode/currency_converter"
    gem.license       = "MIT"

    gem.required_ruby_version     = '>= 2.2'
    gem.required_rubygems_version = '>= 1.8.11'

    gem.files         = `git ls-files`.split($/)
    gem.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
    gem.test_files    = spec.files.grep(%r{^(test|spec|features)/})
    gem.require_paths = ["lib"]

    gem.add_development_dependency 'rake'
    gem.add_development_dependency 'bundler', '~> 1.10'
    gem.add_development_dependency 'rspec', '~> 3.1'
    gem.add_development_dependency 'pry'
    gem.add_development_dependency 'rake'
end
