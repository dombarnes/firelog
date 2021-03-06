require 'rubygems'
require 'bundler'
Bundler.require

require 'date'
Dotenv.load

class FireLog < Sinatra::Base
  register Sinatra::Initializers
  env = ENV['RACK_ENV'] || 'development'

  configure do
    set :root, File.expand_path('./')
    set :views, proc { File.join(root, 'app/views/') }
    set :method_override, true
    set :public_folder, proc { File.join(root, '/public') }
    enable :sessions
    set :session_secret, ENV['RACK_SECRET']
  end

  configure :production, :development do
    enable :logging
  end

  config = YAML.load(ERB.new(File.read(File.join(root, '/config/database.yml'))).result)
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection env.to_sym

  Dir['./lib/*.rb'].sort.each do |file|
    load file
  end

  get '/' do
    @title = 'Hello World'
    erb :index
  end
end
