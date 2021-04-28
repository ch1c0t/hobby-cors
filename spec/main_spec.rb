require_relative 'helper'

describe Hobby::CORS do
  include Rack::Test::Methods

  describe 'by default' do
    def app
      Class.new do
        include Hobby
        use Hobby::CORS

        post do
          'some response'
        end
      end.new
    end

    it 'responds with permissive CORS headers to preflight requests' do
      options '/'

      h = last_response.headers
      expect(h['Access-Control-Allow-Origin']).to eq '*'
      expect(h['Access-Control-Allow-Methods']).to eq 'POST, OPTIONS'
      expect(h['Access-Control-Allow-Headers']).to eq 'Authorization, Content-Type'
      expect(h['Access-Control-Max-Age']).to eq '86400'
    end

    it 'responds with permissive CORS header to POST requests' do
      post '/'

      expect(last_response.headers['Access-Control-Allow-Origin']).to eq '*'
      expect(last_response.body).to eq 'some response'
    end
  end

  describe 'with specified origins' do
    def app
      Class.new do
        include Hobby
        use Hobby::CORS, origins: ['https://some.origin']

        post do
          'some response'
        end
      end.new
    end

    it 'fails if a request has no Origin header' do
      post '/'
      expect(last_response.status).to eq 400
    end

    it 'fails if a request has an Origin header different from specified' do
      header 'Origin', 'https://some.other'
      post '/'

      expect(last_response.status).to eq 400
    end

    it 'passed with the specified Origin header' do
      header 'Origin', 'https://some.origin'
      post '/'
      
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq 'some response'
      expect(last_response.headers['Access-Control-Allow-Origin']).to eq 'https://some.origin'
    end
  end
end
