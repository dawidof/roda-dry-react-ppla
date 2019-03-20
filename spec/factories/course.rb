# frozen_string_literal: true

Factory.define :course do |f|
  f.name { fake(:app, :name) }

  f.timestamps
end
