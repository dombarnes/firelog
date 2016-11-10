class ReadingController < ApplicationController
  get '/' do
    @readings = Reading.yesterday.all
    erb :'readings/index'
  end

  get '/new' do
    @reading = Reading.new
    erb :'/readings/new'
  end

  get '/:id' do
    @reading = Reading.find(params[:id])
    erb :'/readings/show'
  end

  post '/' do
    puts params[:reading]
    @reading = Reading.new(params)
    if @reading.save!
      redirect '/readings'
    else
      halt 500
    end
  end

  delete '/:id' do
    Reading.destroy(params[:id])
  end
end
