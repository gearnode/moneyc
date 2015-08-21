lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require '
/version'

Gem::Specification.new do |spec|
	spec.name          = "currency_converter"
	spec.version       = CurrencyConverter::VERSION
	spec.authors       = ["Bryan FRIMIN"]
	spec.email         = ["bfrimin@student.42.fr"]
	spec.description   = %q{...}
	spec.summary       = %q{...}
	spec.homepage      = "https://github.com/gearnode/currency_converter"
	spec.license       = "MIT"

	spec.required_ruby_version     = '>= 2.2'
	spec.required_rubygems_version = '>= 1.8.11'

	spec.files         = `git ls-files`.split($/)
	spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
	spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
	spec.require_paths = ["lib"]

	spec.add_runtime_dependency 'rake', '~> 0.8', '>= 0.8.7'

	spec.add_development_dependency 'rspec', '~> 3.1'
end