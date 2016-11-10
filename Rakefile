require 'sinatra/activerecord/rake'
require './app'

Dir['./lib/tasks/*.rake'].each { |f| load f }

namespace :db do
  task :load_config do
    require "./app"
  end
end

task default: :test
