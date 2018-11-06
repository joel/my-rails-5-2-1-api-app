require 'rails_helper'

RSpec.describe "items#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/items/#{item.id}",
      params: params
  end

  describe 'basic fetch' do
    let!(:item) { create(:item) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:item, item, json_item)
    end
  end
end
