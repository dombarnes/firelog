require 'spec_helper'
require 'rack/test'

describe 'Readings' do
  it 'displays the readings page' do
    get '/readings'
    expect(last_response).to be_ok
    expect(last_response.body).to_include '<h1>Readings</h1>'
  end
end

