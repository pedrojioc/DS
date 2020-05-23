source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.0.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
#gem 'redis', '~> 3.3', '>= 3.3.1'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'haml-rails'
gem 'devise', github: "plataformatec/devise"
gem 'omniauth-facebook'
gem 'jquery-turbolinks', '~> 2.1'
#Annotate
gem 'annotate'
#Best in place for better edit forms
gem 'best_in_place', '~> 3.0.1'
#Paperclip para subir archivos
gem 'paperclip', '~> 5.0.0'
#Remotipart to upload file with AJAX
gem 'remotipart', github:"urielhdz/remotipart"
#AASM para state machines
gem 'aasm'
#Activemodel serializers xml to work with draper
gem 'activemodel-serializers-xml', github: 'rails/activemodel-serializers-xml'
#Draper para nuestros decoradores
gem 'draper', github: 'audionerd/draper', branch: 'rails5'
#Will paginate, para paginación
gem 'will_paginate'
#Sidekiq para los trabajos en el background
gem 'sidekiq'
#Sinatra
gem 'sinatra', github:"sinatra/sinatra", require: nil
#Jquery-UI
gem 'jquery-ui-rails'
#
#gem 'rack-mini-profiler'
#Moments js
#gem 'momentjs-rails', '~> 2.15', '>= 2.15.1'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'shoulda-matchers' #Métodos de ayuda espesificos
  gem 'rspec-rails', '~> 3.5.0.beta1'#Frameworks de pruebas
  gem 'factory_girl_rails', '~> 4.0'#Nos permite crear objetos de la BD para pruebas
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rb-readline'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
