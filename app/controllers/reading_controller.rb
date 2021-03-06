class ReadingController < ApplicationController
  helpers ApplicationHelpers
  require_relative './application_controller.rb'

  get '/' do
    if params[:days]
      @start = params[:days].to_i.days.ago
      @end = DateTime.now
    elsif params[:start] && params[:end]
      @end = DateTime.parse(params[:end])
      @start = DateTime.parse(params[:start])
    else
      @start = DateTime.now - 3.days
      @end = DateTime.now
    end
    @readings = Reading.where(date: @start...@end)
    @temp = params[:scale] || 'C'
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

  post '/new' do
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
