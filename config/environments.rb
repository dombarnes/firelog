require 'zlib'
require 'sinatra'
require 'logger'
require 'erb'
require 'yaml'

configure do
  set :views, 'app/views'
  set :post_code, ENV['POSTCODE']
  set :nest_email, ENV['NEST_EMAIL']
  set :nest_password, ENV['NEST_PASS']
end

configure :development do
  set :show_exceptions, true
  $log = Logger.new(STDOUT)
  $log = Logger::DEBUG
end

configure :development, :test do
  require 'pry'
end
configure :production do
  $log = Logger.new(STDOUT)
  $log.level = Logger::DEBUG
  # Spit stdout and stderr to a file during production
  # in case something goes wrong
  $stdout.reopen("logs/production.log", "w")
  $stdout.sync = true
  $stderr.reopen($stdout)
end
