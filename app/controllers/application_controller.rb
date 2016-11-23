class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers ApplicationHelpers

  set :root, File.expand_path('./')
  set :views, proc { File.join(root, '/app/views') }
  set :method_override, true
  enable :sessions
  set :session_secret, ENV['RACK_SECRET']  
  
  get '/' do
    erb :index
  end
end
