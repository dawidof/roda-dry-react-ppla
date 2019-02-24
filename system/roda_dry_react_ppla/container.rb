require "dry/web/container"
require "dry/system/components"

module RodaDryReactPpla
  class Container < Dry::Web::Container
    configure do
      config.name = :roda_dry_react_ppla
      config.listeners = true
      config.default_namespace = "roda_dry_react_ppla"
      config.auto_register = %w[lib/roda_dry_react_ppla]
    end

    load_paths! "lib"
  end
end
