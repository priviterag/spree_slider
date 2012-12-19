ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

require 'spree/core/testing_support/factories'
require 'spree/core/testing_support/env'
require 'spree/core/testing_support/controller_requests'
require 'spree/core/url_helpers'

RSpec.configure do |config|
  config.mock_with :rspec
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  config.include Spree::Core::TestingSupport::ControllerRequests
  config.include Devise::TestHelpers, :type => :controller
end
