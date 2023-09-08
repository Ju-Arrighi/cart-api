require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'conditions to an order to exist' do
    it 'quantity should be smaller then product stock'
    it 'quantity, product_id, cart_id must exist to open an order'
    it 'an order have to be placed inside the same cart'
    it 'quantity can not be negative number'
  end

  context 'associations with shoulda matchers' do
    # it { should have_one(:inventory) }
  end

  # context 'conditions for product to exist' do
  #   it 'stock has to be non-negative'
    # expect(subject.stock >= 0).to be(true)
  # end
end
