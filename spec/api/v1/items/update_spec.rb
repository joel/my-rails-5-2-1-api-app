require 'rails_helper'

RSpec.describe "items#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/items/#{item.id}", payload
  end

  describe 'basic update' do
    let!(:item) { create(:item) }

    let(:payload) do
      {
        data: {
          id: item.id.to_s,
          type: 'items',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect {
        make_request
      }.to change { item.reload.attributes }
      assert_payload(:item, item, json_item)

      # ... assert updates attributes ...
    end
  end
end
