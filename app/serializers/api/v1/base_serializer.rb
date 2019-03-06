# frozen_string_literal: true

require 'jsonapi/serializable'

module Api
  module V1
    class BaseSerializer < JSONAPI::Serializable::Resource
      extend JSONAPI::Serializable::Resource::KeyFormat

      key_format ->(key) { key.to_s.camel_case_lower }
    end
  end
end
