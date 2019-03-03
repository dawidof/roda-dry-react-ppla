# frozen_string_literal: true

Factory.define :course do |f|
  f.name { fake(:app, :name) }
  f.url { fake(:internet, :url) }
  f.timestamps
end
