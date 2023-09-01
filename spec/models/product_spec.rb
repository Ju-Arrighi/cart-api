require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations with shouda matchers' do
    it { is_expected.to validate_presence_of(:product_type) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
