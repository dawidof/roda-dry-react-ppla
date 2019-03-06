# frozen_string_literal: true

require 'jsonapi/serializable'
require 'roda_dry_react_ppla/render'

class RodaDryReactPpla::Web
  render = ->(resource) { RodaDryReactPpla::Render.new(resource, klass: 'api/v1/question').call }
  route 'api/v1/questions' do |r|
    r.is do
      render.call(question_repo.questions.to_a)
    end

    r.is Integer do |id|
      render.call(question_repo.questions.by_pk(id).one!)
    end
  end
end
