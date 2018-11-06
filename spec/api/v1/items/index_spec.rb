require 'rails_helper'

RSpec.describe "items#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/items",
      params: params
  end

  describe 'basic fetch' do
    let!(:item1) { create(:item) }
    let!(:item2) { create(:item) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(true)).to match_array([item1.id, item2.id])
      assert_payload(:item, item1, json_items[0])
      assert_payload(:item, item2, json_items[1])
    end
  end
end
