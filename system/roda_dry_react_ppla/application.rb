# frozen_string_literal: true

require 'roda'
require 'roda/plugins/flow'
require 'dry-configurable'

module RodaDryReactPpla
  class Application < ::Roda
    extend Dry::Configurable

    setting :container, reader: true
    setting :routes

    plugin :flow
    plugin :json

    def self.configure(&block)
      super.tap do
        use(container[:rack_monitor]) if container.config.listeners
      end
    end

    def self.resolve(name)
      container[name]
    end

    def self.[](name)
      container[name]
    end

    def self.load_routes!
      Dir[root.join("#{config.routes}/**/*.rb")].each(&method(:require))
    end

    def self.root
      container.config.root
    end

    def notifications
      self.class[:notifications]
    end
  end
end
