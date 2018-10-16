require 'rubygems'
require './config/environment'
require 'sinatra/activerecord/rake'
require './app'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

Dir['./lib/tasks/*.rake'].each { |f| load f }

task :console do
  Pry.start
end

task :environment do
  require File.expand_path('config/environment', File.dirname(__FILE__))
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
  puts '✅  Data saved'
end

desc 'Trims data entries to keep within free heroku limits'
task :trim_entries do
  entries = Reading.historical.order(date: :desc)
  count = 0
  entries.each do |e|
    if e.date.hour.odd?
      # e.delete
      # count += 1
    end
    if !(e.date.hour / 4.0).is_a? Integer
      e.delete
      count += 1
    end
  end
  puts "Deleted #{count} entries up to #{entries.last.date.strftime("%D-%m-%y")}"
end

task default: ['spec']
