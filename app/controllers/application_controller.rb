class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers ApplicationHelpers

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../../views', __FILE__)
  enable :sessions, :method_override

  # don't enable logging when running tests
  configure :production, :development do
    enable :logging
  end

  get '/' do
    erb :index
  end

end
