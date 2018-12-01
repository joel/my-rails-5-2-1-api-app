require 'rails_helper'

RSpec.describe 'items#destroy', type: :request do
  let!(:todo) { item.todo }
  let(:item)  { create(:item) }

  subject(:make_request) do
    jsonapi_delete "/api/v1/items/#{item.id}"
  end

  describe 'basic update' do
    it 'updates the resource' do
      expect {
        make_request
      }.to change { Item.count }.by(-1)
    end
  end
end
