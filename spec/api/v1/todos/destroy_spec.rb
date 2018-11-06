require 'rails_helper'

RSpec.describe "todos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/todos/#{todo.id}"
  end

  describe 'basic destroy' do
    let!(:todo) { create(:todo) }

    it 'updates the resource' do
      expect {
        make_request
      }.to change { Todo.count }.by(-1)

      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
