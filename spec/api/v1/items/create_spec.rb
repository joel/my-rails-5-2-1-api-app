require 'rails_helper'

RSpec.describe "items#create", type: :request do
  let(:todo_id) { SecureRandom.uuid }
  let(:item_id) { SecureRandom.uuid }

  before { Timecop.freeze(Time.local(1990)) }
  
  subject(:make_request) do
    jsonapi_post "/api/v1/todos", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          id: todo_id.to_s,
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
          "id": "#{todo_id}",
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
                "id": "#{todo_id}",
                "title": "Bucket List",
                "owner": "John Doe",
                "created_at": "1989-12-31T23:00:00.000Z",
                "updated_at": "1989-12-31T23:00:00.000Z"
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
      }.to change { 
        Item.count 
      }.by(1).and change { 
        Todo.count 
      }.by(1)
binding.pry
      expect(body_response).to eql(JSON.load(full_response.to_json))
    end
  end
end
