source 'https://rubygems.org'


gemspec

group :development do
  gem 'growl' if RUBY_PLATFORM =~ /darwin/
  if RUBY_PLATFORM =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/ then
    gem 'rb-notifu'
  end
end
