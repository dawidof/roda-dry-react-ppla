module Test
  module DatabaseHelpers
    module_function

    # def rom
    #   RodaDryReactPpla::Container["persistence.rom"]
    # end

    def db
      RodaDryReactPpla::Container["persistence.db"]
    end
  end
end
