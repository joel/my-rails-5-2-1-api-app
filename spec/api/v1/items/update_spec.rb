require 'rails_helper'

RSpec.describe 'items#update', type: :request do
  let(:todo) { create(:todo, title: 'Bucket List', owner: 'John Doe') }
  let(:item) { create(:item, title: 'Tricycle') }

  before do
    Timecop.freeze(Time.local(1990))
    todo.items << item
  end

  subject(:make_request) do
    jsonapi_put "/api/v1/items/#{item.id}", payload
  end

  describe 'basic update' do
    let(:payload) do
      {
        data: {
          id: item.id.to_s,
          type: 'items:s',
          attributes: {
            done: true
          }
        }
      }
    end

    let(:full_response) do
      {
        'data': {
          'id': item.id.to_s,
          'type': 'items',
          'attributes': {
            'done': true,
            'title': 'Tricycle',
            'todo': {
              'id': todo.id.to_s,
              'title': 'Bucket List',
              'owner': 'John Doe',
              'created_at': '1990-01-01T00:00:00.000Z',
              'updated_at': '1990-01-01T00:00:00.000Z'
            }
          }
        },
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
        item.reload.done
      }.to(true)

      expect(body_response['data']).to include(JSON.load(full_response.to_json)['data'])
    end
  end
end
