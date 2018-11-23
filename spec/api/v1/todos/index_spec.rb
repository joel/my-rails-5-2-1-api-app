require 'rails_helper'

RSpec.describe 'todos#index', type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get '/api/v1/todos',
      params: params
  end

  describe 'basic fetch' do
    let!(:todo1) { create(:todo) }
    let!(:todo2) { create(:todo) }

    it 'serializes the list correctly' do
      make_request
      expect(json_ids(false)).to match_array([todo1.id, todo2.id])
      assert_payload(:todo, todo1, json_items[0])
      assert_payload(:todo, todo2, json_items[1])
    end
  end
end
