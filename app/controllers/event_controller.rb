class EventController < ApplicationController
  helpers ApplicationHelpers
  require_relative './application_controller.rb'

  # index
  get '/events' do
    @events = Event.all
    erb :'events/index'
  end

  # new
  get '/events/new' do
    @event = Event.new
    erb :'/events/new'
  end

  # create
  post '/events/new' do
    @event = Event.new(params[:event])
    if @event.save?
      redirect '/events'
    else
      halt 500
    end
  end

  # show
  get '/events/:id' do
    @event = Event.find(params[:id])
    erb :'/show'
  end

  # delete
  delete '/events/:id' do
    Event.destroy(params[:id])
    if resource
      resource.destroy
    else
      halt 404
    end
  end

end
