require 'rails_helper'

RSpec.describe "items#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/items/#{item.id}"
  end

  describe 'basic destroy' do
    let!(:item) { create(:item) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { Item.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
