require 'rails_helper'

RSpec.describe 'items#update', type: :request do
  let(:todo) { create(:todo, title: 'Bucket List', owner: 'John Doe') }
  let(:item) { create(:item, title: 'Tricycle') }

  before do
    Timecop.freeze(Time.local(1990))
    todo.items << item
  end

  subject(:make_request) do
    jsonapi_put "/api/v1/todos/#{todo.id}", payload
  end

  describe 'basic update' do
    let(:payload) do
      {
        data: {
          id: todo.id.to_s,
          type: 'todos',
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
            attributes: { title: 'Threesome' },
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
              'title': 'Threesome',
              'done': false,
              'todo': {
                'id': todo.id.to_s,
                'title': 'Bucket List',
                'owner': 'John Doe',
                'created_at': '1990-01-01T00:00:00.000Z',
                'updated_at': '1990-01-01T00:00:00.000Z'
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
        item.reload.attributes['title']
      }.to('Threesome')

      expect(body_response).to include(JSON.load(full_response.to_json))
    end
  end
end
