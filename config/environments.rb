require 'zlib'
require 'sinatra'

configure :development do
 set :show_exceptions, true
end

configure :development, :test do
  require 'pry'
end

configure do
  set :views, 'app/views'
end
