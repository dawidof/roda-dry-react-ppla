# frozen_string_literal: true

require 'dry/web/container'
require 'dry/system/components'
Dry::Monitor.load_extensions(:rack)
Dry::Monitor.load_extensions(:sql)

module RodaDryReactPpla
  class Container < Dry::Web::Container
    configure do
      config.name = :roda_dry_react_ppla
      config.listeners = true
      config.default_namespace = 'roda_dry_react_ppla'
      config.auto_register = %w[lib/roda_dry_react_ppla lib/db]
    end

    load_paths! 'lib'
  end
end
