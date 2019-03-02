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
  end
end
