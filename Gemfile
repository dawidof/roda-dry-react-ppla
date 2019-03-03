# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.6.1'

gem 'rake'

# Roda
gem 'roda'
gem 'roda-flow'

# Web framework
gem 'dry-system', github: 'dry-rb/dry-system'
gem 'dry-web'
gem 'puma'

gem 'rack', '>= 2.0'
gem 'rerun'

# Database persistence
gem 'pg'
gem 'rom', github: 'rom-rb/rom'
gem 'rom-sql', github: 'rom-rb/rom-sql'

# Application dependencies
gem 'dry-struct', github: 'dry-rb/dry-struct'
gem 'dry-transaction'
gem 'dry-validation'

## not needed (dry-rb still in development)
gem 'dry-types', github: 'dry-rb/dry-types'

gem 'jsonapi-deserializable', github: 'jsonapi-rb/jsonapi-deserializable', branch: :master
gem 'jsonapi-rb', github: 'jsonapi-rb/jsonapi-rb', branch: :master
gem 'jsonapi-serializable', github: 'jsonapi-rb/jsonapi-serializable', branch: :master

group :development, :test do
  gem 'pry-byebug', platform: :mri
end

group :test do
  gem 'rom-factory'
  gem 'rspec'
  gem 'jsonapi-rspec'
end
