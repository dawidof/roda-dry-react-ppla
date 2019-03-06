# frozen_string_literal: true

Factory.define :question do |f|
  f.code { fake(:app, :name) }
  f.title { fake(:app, :name) }
  f.association(:course)
  f.sequence(:position) { |n| n }

  f.timestamps
end
