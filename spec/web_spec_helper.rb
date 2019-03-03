# frozen_string_literal: true

require_relative 'db_spec_helper'

require 'rack/test'
require 'jsonapi/rspec'

Dir[SPEC_ROOT.join('support/web/*.rb').to_s].each(&method(:require))
Dir[SPEC_ROOT.join('shared/web/*.rb').to_s].each(&method(:require))

require SPEC_ROOT.join('../system/boot').realpath

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include Test::WebHelpers
  config.include JSONAPI::RSpec

  config.define_derived_metadata do |meta|
    meta[:aggregate_failures] = true
  end

  config.before :suite do
    Test::WebHelpers.app.freeze
  end
end
