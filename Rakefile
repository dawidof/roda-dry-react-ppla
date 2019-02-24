require "bundler/setup"
require "pry-byebug" unless ENV["RACK_ENV"] == "production"
require "shellwords"
require_relative "system/roda_dry_react_ppla/container"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new :spec
  task default: [:spec]
rescue LoadError
  puts 'Could load dependencies'
end

Dir[File.dirname(__FILE__) + '/lib/tasks/*.rb'].sort.each(&method(:require))
