require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations with shouda matchers' do
    it { is_expected.to validate_presence_of(:product_type) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:thumbnail) }
  end

  it 'is valid with description, price and category' do
    product = Product.new
    expect(product).to be_valid
  end
  context 'conditions for product to exist' do
    it 'stock has to be non-negative'
    # expect(subject.quantity >= 0).to be(true)
  end
end

  # it 'is invalid without description' do
  #   product = build(:product, description: nil)
  #   product.valid?
  #   expect(product.errors[:description]).to include("can't be blank")
  # end
  # it 'is invalid without description' do
  #   product = build(:product, price: nil)
  #   product.valid?
  #   expect(product.errors[:price]).to include("can't be blank")
  # end
  # it 'is invalid without description' do
  #   product = build(:product, category: nil)
  #   product.valid?
  #   expect(product.errors[:category]).to include("can't be blank")
  # end
  # it 'returns a product full description' do
  #   product = create(:product)
  #   expect(product.full_description).to match("#{product.description} - #{product.price}")
  # end
