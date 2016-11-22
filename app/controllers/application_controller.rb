class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  helpers ApplicationHelpers

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    set :method_override, true
    set :public_folder, proc { File.join(root, '/public') }
  end
# include all ERB files in app/views 
  # set :views, File.expand_path('../../views', __FILE__)
  # configure do
  #   set :root, File.expand_path('./')
  #   enable :static
  #   # set :views, proc { File.join(root, '/app/views') }
  
  #   set :post_code, ENV['POSTCODE']
  #   set :nest_email, ENV['NEST_EMAIL']
  #   set :nest_password, ENV['NEST_PASS']
  # end

  get '/' do
    erb :index
  end
end
