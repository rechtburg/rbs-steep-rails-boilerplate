source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Build JSON APIs with ease and speed
gem "active_model_serializers", "~> 0.10.0"
gem "oj"

gem "annotate"

gem "seed-fu"

gem "activerecord-import"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem "pry"

  gem "factory_bot_rails"
  gem "faker"
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "spring-watcher-listen", "~> 2.0.0"

  gem 'steep', '>= 0.39.0', require: false
  gem 'rbs', '>= 1', require: false
  gem 'rbs_rails', '>= 0.6.0', require: false

  gem "brakeman", require: false

  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :test do
  gem "parallel_tests"
  gem "rspec-rails"
  gem "shoulda-matchers"

  # Code coverage for Ruby
  gem "codecov", "~> 0.2.0", require: false
  gem "simplecov", require: false
  gem "simplecov-parallel", require: false

  gem "database_cleaner"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
