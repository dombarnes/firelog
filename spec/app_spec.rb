require_relative 'spec_helper'

describe FireLog do
  it "returns a 200 status code" do
    get '/' do
      expect(last_response).to be_ok
    end
  end
end
