require 'simplecov-gem-adapter'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter
]

SimpleCov.start 'gem' do
  add_filter '/spec/'
end