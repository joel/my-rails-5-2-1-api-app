require 'rails_helper'

RSpec.describe "items#destroy", type: :request do
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
                { type: 'items', id: item.id.to_s, method: 'destroy' }
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

    it 'updates the resource' do
      expect {
        make_request
      }.to change { Item.count }.by(-1)
    end
  end
end