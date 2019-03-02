# frozen_string_literal: true

require_relative '../boot/string'

RodaDryReactPpla::Container.namespace :serializers do |container|
  app_paths = Pathname(__FILE__).dirname.join('../../app').realpath.to_s
  remove_component_path = ->(file_path, folder) { file_path.sub(app_paths + "/#{folder}/".sub('//', '/'), '') }
  remove_serializer_path = ->(filepath) { remove_component_path.call(filepath, 'serializers').sub('.rb', '') }

  Dir.glob(app_paths + '/serializers/**/*_serializer.rb')
    .map do |file|
      require file
      file_path = remove_serializer_path.(file)
      register_name = file_path.tr('/', '.')
      class_name = Object.const_get(('serializers/' + file_path).classify)
      container.register register_name, class_name
    end
end
