# frozen_string_literal: true

require 'jsonapi/serializable'

module Api
  module V1
    class CourseSerializer < BaseSerializer
      type 'course'

      attributes :id,
        :name,
        :url,
        :created_at,
        :updated_at
    end
  end
end
