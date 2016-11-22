require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra-initializers'
require 'date'
require 'dotenv'
Dotenv.load


class TrueClass; def to_i; 1; end; end
class FalseClass; def to_i; 0; end; end

class FireLog < Sinatra::Base
  register Sinatra::Initializers
  env = ENV['RACK_ENV'] || 'development'

  require './config/environment'
    
  Dir['./lib/*.rb'].sort.each do |file|
    load file
  end

  config = YAML.load(ERB.new(File.read(File.join(root, '/config/database.yml'))).result)
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection env.to_sym

  (Dir['./app/helpers/*.rb'].sort + Dir['./app/models/**/*.rb'].sort + Dir['./app/controllers/*/*.rb'].sort).each do |file|
    require file
  end
  
  get '/' do
    @title = 'Hello World'
    erb :index
  end
end
