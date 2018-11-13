require 'rails_helper'

RSpec.describe "todos#create", type: :request do

  subject(:make_request) do
    jsonapi_post "/api/v1/todos", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'todos',
          attributes: {
            owner: 'John Doe',
            title: 'Bucket List'
          }
        }
      }
    end

    it 'creates the resource' do
      expect {
        make_request
      }.to change { Todo.count }.by(1)
      todo = Todo.last

      assert_payload(:todo, todo, json_item)
    end
  end
end
