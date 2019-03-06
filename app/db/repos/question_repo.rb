# frozen_string_literal: true

require 'repository'

module Db
  module Repos
    class QuestionRepo < Repository[:questions]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
