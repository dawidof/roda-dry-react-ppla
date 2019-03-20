# frozen_string_literal: true

module Api
  module V1
    class CourseSerializer < BaseSerializer
      type 'courses'

      attributes :id,
        :name,
        :created_at,
        :updated_at

      has_many :questions
    end
  end
end
