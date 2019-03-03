# frozen_string_literal: true

class String
  def classify
    split('/').collect do |c|
      c.split('_').collect(&:capitalize).join
    end.join('::')
  end

  def camel_case_lower
    split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
  end
end
