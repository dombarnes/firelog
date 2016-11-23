require 'spec_helper'
require 'rack/test'

describe 'Readings' do
  it 'displays the readings page' do
    visit '/readings'
    save_and_open_page(last_response.body)
    expect(last_response).to be_ok
    expect(last_response.body).to_include '<h1>Readings</h1>'
  end
end
