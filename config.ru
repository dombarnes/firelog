require './config/environment'

use Rack::Static, urls: ['/stylesheets', '/javascripts', '/images', '/fonts'], root: 'public'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
# use Rack::MethodOverride

map('/') { run ApplicationController }
map('/events') { run EventController }
map('/readings') { run ReadingController }
run ApplicationController
