# frozen_string_literal: true

# auto_register: false

module RodaDryReactPpla
  class Render
    extend Dry::Initializer

    param :resource
    option :klass, proc(&:to_s)
    option :pre_klass, default: proc { 'ROM::Struct::' }
    option :serializer, default: proc { serializer }
    option :options, default: proc { {} }

    def call
      renderer.render(
        resource,
        options.merge(class: { klass_name => serializer })
      )
    end

    private

    def renderer
      @renderer ||= JSONAPI::Serializable::Renderer.new
    end

    def klass_name
      (pre_klass + klass.classify).to_sym
    end

    def serializer
      Container.resolve("serializers.#{klass.tr('/', '.')}_serializer")
    end
  end
end
