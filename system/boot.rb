# frozen_string_literal: true

require 'bundler/setup'

begin
  require 'pry-byebug'
rescue LoadError
  puts 'Could not load pry'
end

app_paths = Pathname(__FILE__).dirname.join('../app').realpath

Dir[File.join(app_paths, 'serializers/*.rb')].each do |file|
  require file
end

require_relative 'roda_dry_react_ppla/container'
require_relative 'roda_dry_react_ppla/serializers'

RodaDryReactPpla::Container.finalize!

require 'roda_dry_react_ppla/web'
