require './app'
Dir['./app/{helpers,controllers,models}/*.rb'].each { |file| require file }

# GZip compession
use Rack::Deflater
use Rack::Static, urls: ['/stylesheets', '/javascripts'], root: 'public'

map('/') { run ApplicationController }
map('/events') { run EventController }
map('/readings') { run ReadingController }

run FireLog
