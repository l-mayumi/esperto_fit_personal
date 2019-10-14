require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'app/channels'
  add_filter 'app/jobs'
  add_filter 'app/mailers'
  add_filter 'app/helpers'
end

require 'spec_helper'
require 'webmock/rspec'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_driver = :selenium_chrome

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include RequestStub

  config.include Warden::Test::Helpers

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
  config.include Warden::Test::Helpers
  config.include Devise::Test::IntegrationHelpers, type: :request
end
