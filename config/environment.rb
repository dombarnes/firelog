ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

Dir["./app/{models,helpers,controllers}/*.rb"].each do |file| 
  puts File.expand_path(file)
  require file
end

require './app'
