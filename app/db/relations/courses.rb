# frozen_string_literal: true

module Db
  module Relations
    class Courses < ROM::Relation[:sql]
      schema(:courses, infer: true)
    end
  end
end
