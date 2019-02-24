require "dry/web/container"
require "dry/system/components"
Dry::Monitor.load_extensions(:rack)

module RodaDryReactPpla
  class Container < Dry::Web::Container
    configure do
      config.name = :roda_dry_react_ppla
      config.listeners = true
      config.default_namespace = "roda_dry_react_ppla"
      config.auto_register = %w[lib/roda_dry_react_ppla lib/persistence]
    end

    load_paths! "lib"
  end
end
