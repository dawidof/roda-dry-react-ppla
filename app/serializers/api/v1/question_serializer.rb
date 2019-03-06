# frozen_string_literal: true

require_relative 'base_serializer'

module Api
  module V1
    class QuestionSerializer < BaseSerializer
      type 'questions'

      attributes :id,
        :code,
        :title,
        :position,
        :course_id,
        :created_at,
        :updated_at

      belongs_to :course
    end
  end
end
