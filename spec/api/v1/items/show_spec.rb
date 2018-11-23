require 'rails_helper'

RSpec.describe 'items#show', type: :request do
  let!(:todo) { create(:todo, title: 'Bucket List', owner: 'John Doe') }
  let(:item)  { create(:item, title: 'Tricycle') }

  before { todo.items << item }

  subject(:make_request) { jsonapi_get "/api/v1/todos/#{todo.id}?include=items" }

  let(:full_response) do
    {
      'data': {
        'id': todo.id.to_s,
        'type': 'todos',
        'attributes': {
          'title': 'Bucket List',
          'owner': 'John Doe'
        },
        'relationships': {
          'items': {
            'data': [
              {
                'type': 'items',
                'id': item.id.to_s
              }
            ]
          }
        }
      },
      'included': [
        {
          'id': item.id.to_s,
          'type': 'items',
          'attributes': {
            'title': 'Tricycle',
            'done': false,
            'todo': {
              'id': todo.id.to_s,
              'title': 'Bucket List',
              'owner': 'John Doe',
              'created_at': '2018-11-11T19:10:22.106Z',
              'updated_at': '2018-11-11T19:10:22.130Z'
            }
          }
        }
      ],
      'meta': {},
      'jsonapi': {
        'version': '1.0'
      }
    }
  end

  let(:body_response) { JSON.load(response.body) }

  it do
    make_request
    expect(body_response['data']).to include(JSON.load(full_response.to_json)['data'])
  end
end
