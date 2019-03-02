# frozen_string_literal: true

module Persistence
  module Relations
    class Courses < ROM::Relation[:sql]
      schema(:courses, infer: true) do
        attribute :id, Types::Serial
        attribute :name, Types::String
        attribute :url, Types::String

        attribute :created_at, Types::Time
        attribute :updated_at, Types::Time
      end
    end
  end
end
