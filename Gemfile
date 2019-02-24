source "https://rubygems.org"

gem "rake"

# Roda
gem 'roda'
gem 'roda-flow'

# Web framework
gem "dry-system", "~> 0.9"
gem "dry-web", "~> 0.7"
gem "puma"

gem "rack", ">= 2.0"
gem "rerun"

# Database persistence
gem "pg"
gem "rom", "~> 4.0"
gem "rom-sql", "~> 2.1"

# Application dependencies
gem "dry-struct", "~> 0.3"
gem "dry-transaction", "~> 0.10"
gem "dry-validation", "~> 0.11"

group :development, :test do
  gem "pry-byebug", platform: :mri
end

group :test do
  gem "rspec"
  gem "rom-factory", "~> 0.5"
end
