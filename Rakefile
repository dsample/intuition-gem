require 'rake'
require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

RSpec::Core::RakeTask.new(:spec) do |options|
  options.rspec_opts = '--no-color --format progress' if ENV['GO_TRIGGER_USER']
end

desc "Run code coverage stats"
task :coverage do
	ENV['COVERAGE'] = "true"
  Rake::Task['spec'].execute
end

task :default => :spec
