require 'dotenv'
Dotenv.load

require 'sinatra/base'
require 'sinatra/activerecord'

class FireLog < Sinatra::Base
  
  env = ENV['RACK_ENV'] || 'development'

  require './config/environments'
  
  Dir['./lib/*.rb'].sort.each do |file|
    load file
  end

  config = YAML.load(ERB.new(File.read(File.join(root, '/config/database.yml'))).result)
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection env.to_sym
  enable :sessions

  (Dir['./app/helpers/*.rb'].sort + Dir['./app/models/**/*.rb'].sort + Dir['./app/controllers/*/*.rb'].sort).each do |file|
    require file
  end

  get '/' do
    @title = 'Hello World'
    erb :index
  end
end
