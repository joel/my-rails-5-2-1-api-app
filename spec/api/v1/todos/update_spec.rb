require 'rails_helper'

RSpec.describe 'todos#update', type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/todos/#{todo.id}", payload
  end

  describe 'basic update' do
    let!(:todo) { create(:todo) }

    let(:payload) do
      {
        data: {
          id: todo.id.to_s,
          type: 'todos',
          attributes: {
            title: 'Bucket List'
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    it 'updates the resource' do
      expect {
        make_request
      }.to change { todo.reload.attributes }
      assert_payload(:todo, todo, json_item)

      # ... assert updates attributes ...
    end
  end
end
