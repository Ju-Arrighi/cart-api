require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "GET /index" do
    it 'get index and return 200 OK' do
      get cart_orders_path
      expect(response).to have_http_status(200)
    end
  end
end
