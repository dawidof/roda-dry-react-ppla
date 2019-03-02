# frozen_string_literal: true

require 'jsonapi/serializable'

module Serializers
  class CourseSerializer < JSONAPI::Serializable::Resource
    type 'course'

    attributes :id,
      :name,
      :url,
      :created_at,
      :updated_at
  end
end
