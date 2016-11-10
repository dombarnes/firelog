require_relative 'spec_helper'
require_relative '../firelog.rb'

def app
  Firelog
end

describe Firelog do
  it 'responds with a welcome message' do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
