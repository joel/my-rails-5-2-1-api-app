require 'rails_helper'

RSpec.describe 'items#update', type: :request do
  let!(:todo) { item.todo }
  let(:item)  { create(:item) }

  subject(:make_request) do
    jsonapi_put "/api/v1/todos/#{todo.id}", payload
  end

  describe 'basic update' do
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
                { type: 'items', id: item.id.to_s, method: 'update' }
              ]
            }
          }
        },
        included: [
          {
            type: 'items',
            id: item.id.to_s,
            attributes: { title: 'Tricycle' },
          }
        ]
      }
    end

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

    it 'updates the resource' do
      expect {
        make_request
      }.to change {
        todo.reload.attributes['title']
      }.to('Bucket List').and change {
        todo.reload.attributes['owner']
      }.to('John Doe').and change {
        item.reload.attributes['title']
      }.to('Tricycle')

      expect(body_response['data']).to include(JSON.load(full_response.to_json)['data'])
    end
  end
end
