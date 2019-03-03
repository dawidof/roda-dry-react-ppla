# frozen_string_literal: true

module Test
  module DatabaseHelpers
    module_function

    def rom
      RodaDryReactPpla::Container['db.rom']
    end

    def db
      RodaDryReactPpla::Container['db.connection']
    end

    def create(resource, attributes = {})
      Factory[resource, attributes]
    end
  end
end
