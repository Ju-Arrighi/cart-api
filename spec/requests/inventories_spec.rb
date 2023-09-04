require 'rails_helper'

RSpec.describe "Inventories", type: :request do
  describe "GET /inventories" do
    it 'get index and return 200 OK' do
      get inventories_path
      expect(response).to have_http_status(200)
    end
  end
end
