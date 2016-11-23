ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
Dir.glob('./app/{models,helpers,extensions,controllers}/*.rb').each {  |file| 
  require file 
}
require './app'
