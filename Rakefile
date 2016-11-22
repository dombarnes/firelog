require './config/environment'
require 'sinatra/activerecord/rake'
require 'rspec/core/rake_task'

Dir['./lib/tasks/*.rake'].each { |f| load f }

RSpec::Core::RakeTask.new :specs do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task :console do
  Pry.start
end

namespace :db do
  task :load_config do
    require './app'
  end
end

desc 'Fetches Nest temp and current temperature'
task :temps do
  data = NestData.new
  data.fetch_data
  Reading.create(data.to_hash)
  puts '✅ Data saved'
end

task :default => ['specs']
