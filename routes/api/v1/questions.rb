# frozen_string_literal: true

require 'jsonapi/serializable'
require 'roda_dry_react_ppla/render'

class RodaDryReactPpla::Web
  render = ->(resource, r) { RodaDryReactPpla::Render.new(resource, classes: ['api/v1/course', 'api/v1/question'], options: { include: r.params['include'] }).call }

  route 'api/v1/questions' do |r|
    r.is do
      render.call(question_repo.questions.combine(:courses), r)
    end

    r.is Integer do |id|
      render.call(question_repo.questions.by_pk(id).combine(:courses), r)
    end
  end
end
