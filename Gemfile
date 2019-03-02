source "https://rubygems.org"

gem "rake"

# Roda
gem 'roda'
gem 'roda-flow'

# Web framework
gem "dry-system", github: 'dry-rb/dry-system'
gem "dry-web"
gem "puma"

gem "rack", ">= 2.0"
gem "rerun"

# Database persistence
gem "pg"
gem "rom", github: 'rom-rb/rom'
gem "rom-sql", github: 'rom-rb/rom-sql'

# Application dependencies
gem "dry-struct", github: 'dry-rb/dry-struct'
gem "dry-transaction"
gem "dry-validation"

## not needed (dry-rb still in development)
gem 'dry-types', github: 'dry-rb/dry-types'

gem 'jsonapi-rb'

group :development, :test do
  gem "pry-byebug", platform: :mri
end

group :test do
  gem "rspec"
  gem "rom-factory"
end
