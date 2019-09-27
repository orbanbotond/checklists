source 'https://rubygems.org'
ruby '2.2.0'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.3'
gem 'sass-rails', '~> 5.0.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.7'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.9'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# gem 'subscribem', :path => "../multitenancy/subscribem"
gem 'subscribem', git: 'https://github.com/orbanbotond/subscribem.git'
gem 'awesome_print'
gem 'display_case'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'inherited_resources', '~> 1.6'

gem 'pry'
gem 'pry-nav'
gem 'wisper'

gem 'pundit'
gem 'devise_invitable'
gem 'chewy'
gem 'coveralls', require: false

group :development do
  gem 'quiet_assets'
  gem 'spring-commands-rspec'
  gem 'rails_layout'
  gem 'better_errors'
  gem 'binding_of_caller', platforms: [:mri_20]
end

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'database_cleaner', '~> 1.4'
  gem 'capybara', '~> 2.4'
  gem 'wisper-rspec'

  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.1'

  gem 'spring', '~> 2.0'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
  # gem 'postmark-rails'
end
