require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:todo) { build(:todo) }
  it { expect(todo).to be_valid }
end
