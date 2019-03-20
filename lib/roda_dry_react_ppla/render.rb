# frozen_string_literal: true

# auto_register: false

module RodaDryReactPpla
  class Render
    extend Dry::Initializer

    param :resource
    option :classes
    option :prepend_model_class, default: proc { 'ROM::Struct::' }
    option :options, default: proc { {} }

    def call
      renderer.render(
        resource,
        options.merge(class: classes_hash)
      )
    end

    private

    def renderer
      @renderer ||= JSONAPI::Serializable::Renderer.new
    end

    def classes_hash
      classes.each_with_object({}) do |klass, o|
        o[model_class(klass)] = serializer(klass)
      end
    end

    def model_class(klass)
      (prepend_model_class + class_name_without_api_version(klass).classify).to_sym
    end

    def serializer(klass)
      Container.resolve("serializers.#{klass.tr('/', '.')}_serializer")
    end

    def class_name_without_api_version(klass)
      klass.sub(%r{api/v\d{1,2}/}, '')
    end
  end
end
