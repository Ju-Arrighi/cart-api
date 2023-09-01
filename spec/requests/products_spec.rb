require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    it 'get index and return 200 OK' do
      get products_path
      expect(response).to have_http_status(200)
    end
  end
end
