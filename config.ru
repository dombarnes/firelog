require './app'
require 'sinatra/base'
Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }

# GZip compession
use Rack::Deflater

map('/events') { run EventController }
map('/readings') { run ReadingController }
map('/') { run ApplicationController }

run Sinatra::Application
