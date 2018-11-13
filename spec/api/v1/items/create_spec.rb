require 'rails_helper'

RSpec.describe "items#create", type: :request do
  let(:todo)    { create(:todo) }
  let(:item_id) { SecureRandom.uuid }
  
  subject(:make_request) do
    jsonapi_put "/api/v1/todos/#{todo.id}", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          id: todo.id.to_s,
          type: 'todos',
          attributes: {
            owner: 'John Doe',
            title: 'Bucket List'
          },
          relationships: {
            items: {
              data: [
                { type: 'items', id: item_id.to_s, method: 'create' }
              ]
            }
          }
        },
        included: [
          {
            type: 'items',
            id: item_id.to_s,
            attributes: { title: 'Tricycle' },
          }
        ]
      }
    end
    
    let(:full_response) do
      {
        "data": {
          "id": "#{todo.id}",
          "type": "todos",
          "attributes": {
            "title": "Bucket List",
            "owner": "John Doe"
          },
          "relationships": {
            "items": {
              "data": [
                {
                  "type": "items",
                  "id": "#{item_id}"
                }
              ]
            }
          }
        },
        "included": [
          {
            "id": "#{item_id}",
            "type": "items",
            "attributes": {
              "title": "Tricycle",
              "done": false,
              "todo": {
                "id": "#{todo.id}",
                "title": "Bucket List",
                "owner": "John Doe",
                "created_at": "2018-11-11T19:42:27.179Z",
                "updated_at": "2018-11-11T19:42:27.195Z"
              }
            }
          }
        ],
        "meta": {},
        "jsonapi": {
          "version": "1.0"
        }
      }
    end
  
    let(:body_response) { JSON.load(response.body) }
    
    it 'creates the resource' do
      expect {
        make_request
      }.to change { Item.count }.by(1)
      
      expect(body_response['data']).to include(JSON.load(full_response.to_json)['data'])
    end
  end
end
