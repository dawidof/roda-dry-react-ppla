# frozen_string_literal: true

require 'jsonapi/serializable'
require 'roda_dry_react_ppla/render'

class RodaDryReactPpla::Web
  render = ->(resource) { RodaDryReactPpla::Render.new(resource, klass: 'api/v1/course', options: { include: 'questions'}).call }
  route 'api/v1/courses' do |r|
    r.is do
      render.call(course_repo.courses.to_a)
    end

    r.is Integer do |id|
      render.call(course_repo.courses.by_pk(id).one!)
    end
  end
end
