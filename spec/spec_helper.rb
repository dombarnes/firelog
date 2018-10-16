# encoding: UTF-8
ENV['RACK_ENV'] ||= 'test'
ENV['SINATRA_ENV'] ||= "test"

require 'rspec'
require 'rack/test'
require 'capybara/dsl'
require 'capybara/rspec'

require File.expand_path('../../app.rb', __FILE__)
require File.expand_path("../../config/environment.rb", __FILE__)


set :environment, :test
# Capybara.javascript_driver = :poltergeist

module RSpecMixin
  include Rack::Test::Methods
  def app
    FireLog.new
  end
  # Capybara.app = :app
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #     # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end 

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end 

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  # Limits the available syntax to the non-monkey patched syntax that is
  # recommended. For more details, see:
  #   - http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
  config.disable_monkey_patching!
  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true
  config.expose_dsl_globally = true

  # Many RSpec users commonly either run the entire suite or an individual
  # file, and it's useful to allow more verbose output when running an
  # individual spec file.
  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end 

  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  config.profile_examples = 10
  config.order = :random
  Kernel.srand config.seed
end

Capybara.include RSpecMixin
