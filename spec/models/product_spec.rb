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
end
