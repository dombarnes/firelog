require 'rubygems'
require 'bundler'
require 'sinatra/base'

Bundler.require

require './app'
Dir.glob('./app/{controllers,models,helpers}/*.rb').each { 
  |file| require file 
}

# GZip compession
use Rack::Deflater
use Rack::Static, urls: ['/stylesheets', '/javascripts', '/images', '/fonts'], root: 'public'

map('/') { run ApplicationController }
map('/events') { run EventController }
map('/readings') { run ReadingController }
