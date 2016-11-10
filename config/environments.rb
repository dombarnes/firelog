require 'zlib'
require 'sinatra'
require 'logger'
require 'erb'
require 'yaml'

configure :development do
 set :show_exceptions, true
 $log = Logger.new('logs/development.log','weekly')
end

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end
