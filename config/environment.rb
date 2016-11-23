ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
require './app'
Dir.glob('./app/{models,helpers,extensions,controllers}/*.rb').each {  |file| 
  require file 
}
