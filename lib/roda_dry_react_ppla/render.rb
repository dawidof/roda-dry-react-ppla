# frozen_string_literal: true

# auto_register: false

module RodaDryReactPpla
  class Render
    extend Dry::Initializer

    param :resource
    option :klass, proc(&:to_s)
    option :prepend_model_class, default: proc { 'ROM::Struct::' }
    option :serializer, default: proc { serializer }
    option :options, default: proc { {} }

    def call
      renderer.render(
        resource,
        options.merge(class: { model_class => serializer })
      )
    end

    private

    def renderer
      @renderer ||= JSONAPI::Serializable::Renderer.new
    end

    def model_class
      (prepend_model_class + class_name_without_api_version.classify).to_sym
    end

    def serializer
      Container.resolve("serializers.#{klass.tr('/', '.')}_serializer")
    end

    def class_name_without_api_version
      klass.sub(%r{api/v\d{1,2}/}, '')
    end
  end
end
