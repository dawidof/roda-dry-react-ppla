# frozen_string_literal: true

require 'repository'

module Persistence
  module Repositories
    class CoursesRepo < Repository[:courses]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
