# frozen_string_literal: true

require_relative 'base_serializer'

module Api
  module V1
    class AnswerSerializer < BaseSerializer
      type 'answers'

      attributes :id,
        :title,
        :position,
        :question_id,
        :correct,
        :created_at,
        :updated_at

      belongs_to :question
    end
  end
end
