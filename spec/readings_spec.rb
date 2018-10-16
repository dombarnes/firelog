require_relative './spec_helper.rb'
require 'rack/test'

describe 'Readings' do
  it 'should display the readings page' do
    # visit '/readings'
    # save_and_open_page
    get '/'
    expect(last_response).to be_ok
    # expect(last_response.body).to_include '<h1>Readings</h1>'
  end
end
