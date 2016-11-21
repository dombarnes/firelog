require 'spec_helper'
require 'rack/test'


describe 'Readings' do
  it 'responds with readings page' do
    get '/readings'
    expect(last_response).to be_ok
    last_response.body.must_include '<h1>Readings</h1>'
  end
end
