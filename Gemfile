source 'http://rubygems.org'

group :test do
  gem 'rspec-rails', '~> 2.11.0'
  gem 'factory_girl', '~> 2.6.4'
  gem 'factory_girl_rails', '~> 1.7'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
  gem 'sqlite3'

  if RUBY_PLATFORM.downcase.include? "darwin"
    gem 'rb-fsevent'
    gem 'growl'
  end
end

gemspec
