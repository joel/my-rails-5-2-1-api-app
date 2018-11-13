require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { build(:item) }
  it { expect(item).to be_valid }
end
