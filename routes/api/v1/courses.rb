# frozen_string_literal: true

require 'jsonapi/serializable'
require 'roda_dry_react_ppla/render'

class RodaDryReactPpla::Web
  render = ->(resource, r) { RodaDryReactPpla::Render.new(resource, classes: ['api/v1/course', 'api/v1/question'], options: { include: r.params['include'] }).call }

  route 'api/v1/courses' do |r|
    r.is do
      render.call(course_repo.courses.combine(:questions), r)
    end

    r.is Integer do |id|
      render.call(course_repo.courses.by_pk(id).combine(:questions), r)
    end
  end
end
