require 'zlib'
require 'sinatra'
require 'logger'
require 'erb'
require 'yaml'

configure do
  set :root, File.expand_path('../', __FILE__)
  enable :static
  set :public_folder, proc { File.join(root, '../', 'public') }
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
end
