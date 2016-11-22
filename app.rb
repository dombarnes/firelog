require 'rubygems'
require 'bundler'
Bundler.require

require 'date'
Dotenv.load

class FireLog < Sinatra::Base
  register Sinatra::Initializers
  env = ENV['RACK_ENV'] || 'development'
  puts "HelloWorld"
  config = YAML.load(ERB.new(File.read(File.join(root, '/config/database.yml'))).result)
  ActiveRecord::Base.configurations = config
  ActiveRecord::Base.establish_connection env.to_sym
    
  Dir['./lib/*.rb'].sort.each do |file|
    load file
  end

  (Dir['./app/helpers/*.rb'].sort + Dir['./app/models/**/*.rb'].sort + Dir['./app/controllers/*/*.rb'].sort).each do |file|
    require file
  end
  
  get '/' do
    @title = 'Hello World'
    erb :index
  end
end
