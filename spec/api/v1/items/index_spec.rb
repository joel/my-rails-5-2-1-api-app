require 'rails_helper'

RSpec.describe "items#index", type: :request do
  let(:todo) { create(:todo, title: 'Bucket List', owner: 'John Doe') }
  let(:item) { create(:item, title: 'Tricycle') }
  
  before do 
    Timecop.freeze(Time.local(1990))
    todo.items << item
  end
  
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/todos/#{todo.id}/items?filter[title]=Tricycle", params: params
  end
  
  let(:full_response) do
    {
      "data": [
        {
          "id": item.id.to_s,
          "type": "items",
          "attributes": {
            "title": "Tricycle",
            "done": false,
            "todo": {
              "id": todo.id.to_s,
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

  describe 'basic fetch' do

    it 'serializes the list correctly' do
      make_request
      
      expect(JSON.load(response.body)).to include(JSON.load(full_response.to_json))
      expect(json_ids(false)).to match_array([item.id])
    end
  end
end
