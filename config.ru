require_relative './config/environment'

Dir.glob('./app/{models,helpers,extensions,controllers}/*.rb').each {  |file| 
  require file
}

use Rack::Static, urls: ['/stylesheets', '/javascripts', '/images', '/fonts'], root: 'public'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
# use Rack::MethodOverride

map '/' do
  use ApplicationController
end

map '/events' do
  use EventController
end

map '/readings' do
  use ReadingController
end

run ApplicationController
