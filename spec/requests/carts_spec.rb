require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /carts" do
    it 'get index and return 200 OK' do
      get carts_path
      expect(response).to have_http_status(200)
    end
    it 'get show and return 200 OK' do
      get '/carts/1.json'
      # binding.break
      expect(response.body).to include_json(cart[id: 1])
    end
  end
end
