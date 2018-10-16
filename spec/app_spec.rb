require_relative './spec_helper.rb'
require 'rack/test'

describe 'FireLog' do
  it "should return a 200 status code" do
    # visit '/'
    # save_and_open_page
    get '/'
    expect(last_response).to be_ok
    # expect(last_response).to include('<h1>Firelog</h1>')
  end
end
