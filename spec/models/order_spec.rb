require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'conditions to an order to exist' do
    it 'quantity should be smaller then product stock'
    it 'quantity, product_id, cart_id must exist to open an order'
    it 'quantity can not be negative number' do
      expect(subject.stock >= 0).to be(true)
    end
  end

  context 'associations with shoulda matchers' do
    it { should belong_to(:product) }
  end
end
