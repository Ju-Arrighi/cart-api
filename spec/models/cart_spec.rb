require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'validations with shouda matchers' do
    it { is_expected.to validate_presence_of(:total) }
  end

  context 'associations with shoulda matchers' do
    it { should have_many(:orders) }
    it { should have_many(:products) }
  end
end
