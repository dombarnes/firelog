ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

Dir["./app/{models,helpers}/*.rb"].each do |file| 
  require file
end

require_relative '../app/controllers/application_controller.rb'
require_all 'app'
