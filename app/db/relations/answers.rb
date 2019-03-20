# frozen_string_literal: true

module Db
  module Relations
    class Answers < ROM::Relation[:sql]
      schema(:answers, infer: true) do
        associations do
          belongs_to :question
        end
      end

      def by_id(id)
        where(id: id)
      end
    end
  end
end
