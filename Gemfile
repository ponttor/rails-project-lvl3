# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'image_processing', '~> 1.2'
gem 'faker'
gem 'minitest-power_assert'
gem 'rollbar'
gem 'rubocop-rails', require: false
gem 'simple_form'
gem 'slim'
gem 'slim_lint'

gem 'active_storage_validations'
gem 'aws-sdk-s3'
gem 'image_processing'

gem 'dotenv-rails'
gem 'omniauth'
gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-rails_csrf_protection'

gem 'aasm'
gem 'bootstrap5-kaminari-views'
gem 'i18n-debug'
gem 'kaminari'
gem 'pundit'
gem 'rails-i18n'
gem 'ransack', '~> 2.4'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false
gem 'net-smtp', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg', '~> 1.4', '>= 1.4.5'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
