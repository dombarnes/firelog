require 'dotenv'
  Dotenv.load
require 'yaml'

require 'sinatra/base'
require 'sinatra/activerecord'

(Dir['./lib/*.rb'].sort).each do |file|
  load file
end

class FireLog < Sinatra::Base
  set :root, File.dirname(__FILE__)

  env    = ENV['RACK_ENV'] || 'development'
  # root   = File.expand_path '..', __FILE__
  config = YAML.load(ERB.new(File.read(File.join(root, 'config/database.yml'))).result)
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection env.to_sym

  require './config/environments'

  enable :sessions

  (Dir['./app/helpers/*.rb'].sort + Dir['./app/models/**/*.rb'].sort  + Dir['./app/controllers/*/*.rb'].sort).each do |file|
    require file
  end

  set :public_folder => "public", :static => true

  get '/' do
    @title = "Hello World"
    erb :index
  end

end
