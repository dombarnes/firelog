# encoding: UTF-8
ENV['RACK_ENV'] ||= 'test'
ENV['SINATRA_ENV'] ||= "test"

require './config/environment'

require 'rspec'
require 'rack/test'
require 'capybara'
require 'capybara/dsl'

set :environment, :test

module AppHelper
  def app
    FireLog
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include AppHelper
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end 

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end 

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.disable_monkey_patching!
  config.warnings = true
  config.expose_dsl_globally = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end 

  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end
