require 'rails_helper'

RSpec.describe 'todos#show', type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/todos/#{todo.id}", params: params
  end

  describe 'basic fetch' do
    let!(:todo) { create(:todo) }

    it 'serializes the resource correctly' do
      make_request
      assert_payload(:todo, todo, json_item)
    end
  end
end
