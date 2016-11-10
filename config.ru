require 'sinatra/base'
require File.expand_path '../app.rb', __FILE__
require './app'

Dir.glob('./app/{helpers,controllers,models}/*.rb').each { |file| require file }

# GZip compession
use Rack::Deflater

map('/events') { run EventController }
map('/readings') { run ReadingController }
map('/') { run ApplicationController }

run Sinatra::Application
