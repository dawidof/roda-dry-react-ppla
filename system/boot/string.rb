# frozen_string_literal: true

class String
  def classify
    split('/').collect do |c|
      c.split('_').collect(&:capitalize).join
    end.join('::')
  end
end
