# frozen_string_literal: true

module Db
  module Relations
    class Questions < ROM::Relation[:sql]
      schema(:questions, infer: true) do
        associations do
          belongs_to :course
        end
      end

      def by_id(id)
        where(id: id)
      end
    end
  end
end
