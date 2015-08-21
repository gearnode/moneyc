desc 'Open an irb session preloaded with this library'
task :console do
	sh 'irb -rubygems -I lib -r currency_converter.rb'
end