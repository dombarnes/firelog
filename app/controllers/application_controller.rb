class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers ApplicationHelpers

  # include all ERB files in app/views 
  # set :views, File.expand_path('../../views', __FILE__)
  configure do
    set :root, File.expand_path('./')
    enable :static
    enable :sessions
    set :session_secret, ENV['RACK_SECRET']
    set :public_folder, proc { File.join(root, '/public') }
    # set :views, proc { File.join(root, '/app/views') }
    set :views, proc { File.join(root, '/app/views') }
    set :post_code, ENV['POSTCODE']
    set :nest_email, ENV['NEST_EMAIL']
    set :nest_password, ENV['NEST_PASS']
  end

  configure :production, :development do
    enable :logging
    $log = Logger.new(STDOUT)
    $log.level = Logger::DEBUG
  end

  # set folder for templates to ../views, but make the path absolute
  enable :sessions, :method_override

  get '/' do
    erb :index
  end
end
