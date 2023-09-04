require 'rails_helper'

RSpec.describe Inventory, type: :model do
  context 'associations with shoulda matchers' do
    it { should belong_to(:product) }
  end
  context 'methods and conditions' do
    it "doen't allow negative values for quantities" do
      expect(subject.quantity >= 0).to be(true)
    end
  end
end
