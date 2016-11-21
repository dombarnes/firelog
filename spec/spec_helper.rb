# encoding: UTF-8
ENV['RACK_ENV'] = 'test'

require 'rack/test'
require 'rspec'
# require 'bundler'

require "./config/environment"

RSpec.configure do |config|
  config.include Rack::Test::Methods
  
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

describe 'Firelog' do
  include Rack::Test::Methods
  def app
    Sinatra::Application
  end

  it "returns a 200 status code" do
    get '/' do
      expect(last_response).to be_ok
    end
  end
end
require_relative '../app.rb'
