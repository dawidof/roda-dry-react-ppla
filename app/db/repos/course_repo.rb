# frozen_string_literal: true

require 'repository'

module Db
  module Repos
    class CourseRepo < Repository[:courses]
      commands :create, update: :by_pk, delete: :by_pk
    end
  end
end
