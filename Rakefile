require './app'
require 'sinatra/activerecord/rake'

Dir['./lib/tasks/*.rake'].each { |f| load f }

namespace :db do
  task :load_config do
    require "./app"
  end
end

desc 'Fetches Nest temp and current temperature'
task :temps do
  data = NestData.new
  data.fetch_data
  Reading.create(data.to_hash)
  puts "✅ Data saved"
end

task default: :test
