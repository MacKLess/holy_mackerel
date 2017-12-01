require 'rails_helper'

describe Product do
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :guide }
  it { should validate_presence_of :notes }

  it { should have_many :reviews }

  describe '.alphabetical' do
    it 'returns products sorted alphabetically' do
      f1 = Product.create(
        name: "Geoduck",
        cost: 12.99,
        guide: "Good Alternative",
        notes: "Solid addition to any chowder and a delicacy in some areas."
      )
      f3 = Product.create(
        name: "Lionfish",
        cost: 29.99,
        guide: "Best Choices",
        notes: "Requires a specific palate but very good for the liver."
      )
      f2 = Product.create(
        name: "Mahi Mahi",
        cost: 25.99,
        guide: "Avoid",
        notes: "A taste of the islands"
      )
      expect(Product.alphabetical).to eq ([f1, f3, f2])
    end
  end

end
