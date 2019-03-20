# frozen_string_literal: true

require 'jsonapi/serializable'
require 'roda_dry_react_ppla/render'

class RodaDryReactPpla::Web
  render = ->(resource, r) { RodaDryReactPpla::Render.new(resource, classes: ['api/v1/course', 'api/v1/question', 'api/v1/answer'], options: { include: r.params['include'] }).call }

  route 'api/v1/answers' do |r|
    r.is do
      render.call(answer_repo.answers.combine(:questions), r)
    end

    r.is Integer do |id|
      render.call(answer_repo.answers.by_pk(id).combine(:questions), r)
    end
  end
end
