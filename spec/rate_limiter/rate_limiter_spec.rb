require 'spec_helper'

RSpec.describe "rate_limit", type: :request do
  context "#index" do
    before { $redis.flushdb }

    it "test rate_limit endpoint" do
      get "/rate_limit"

      expect(response.status).to eq(204)
    end

    it 'shoud allow only two requests per user on this controller' do
      2.times do
        get "/rate_limit"
        expect(response.status).to eq(204)
      end

      get "/rate_limit"
      expect(response.status).to eq(429)
    end
  end
end
