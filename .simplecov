require 'simplecov-gem-adapter'

if ENV['TRAVIS']
	require 'coveralls'
	Coveralls.wear!
else
	SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
	  SimpleCov::Formatter::HTMLFormatter
	]
end

SimpleCov.start 'gem' do
  add_filter '/spec/'
end