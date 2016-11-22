require 'spec_helper'
require 'rack/test'

describe FireLog do
  it "returns a 200 status code" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response).to contain('<h1>Firelog</h1>')
  end
end
