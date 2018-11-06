require 'rails_helper'

RSpec.describe "items#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/items", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'items',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        make_request
      }.to change { Item.count }.by(1)
      item = Item.last

      assert_payload(:item, item, json_item)
    end
  end
end
