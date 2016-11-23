ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require './app'
Dir.glob('./app/{controllers,models,helpers,extensions}/*.rb').each {  |file| 
  require file 
}

