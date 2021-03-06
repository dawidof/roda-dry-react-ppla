# frozen_string_literal: true

module Db
  module Relations
    class Courses < ROM::Relation[:sql]
      schema(:courses, infer: true) do
        associations do
          has_many :questions
        end
      end

      def by_id(id)
        where(id: id)
      end
    end
  end
end
