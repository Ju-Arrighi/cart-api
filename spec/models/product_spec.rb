require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validations with shouda matchers' do
    it { is_expected.to validate_presence_of(:product_type) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:name) }
  end
  context 'associations with shoulda matchers' do
    it { should have_one(:inventory) }
  end
end

# RSpec.describe Inventory, type: :model do
#   context 'associations with shoulda matchers' do
#     it { should belong_to(:product) }
#   end
#   context 'methods and conditions' do
#     it "doen't allow negative values for quantities" do
#       expect(subject.quantity >= 0).to be(true)
#     end
#   end
# end
