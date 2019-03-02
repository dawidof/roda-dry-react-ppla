# frozen_string_literal: true

require 'bundler/setup'

begin
  require 'pry-byebug'
rescue LoadError
end

require_relative 'roda_dry_react_ppla/container'

RodaDryReactPpla::Container.finalize!

require 'roda_dry_react_ppla/web'
