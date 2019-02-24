require "import"

module Persistence
  class CourseRepo
    include Import['persistence.db']

    def find(conditions)
      db[:courses].where(conditions)
    end
  end
end
