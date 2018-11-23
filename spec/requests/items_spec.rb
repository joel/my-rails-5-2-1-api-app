require 'rails_helper'

RSpec.describe 'Items', type: :request do
  let(:todo) { create(:todo, title: 'Bucket List', owner: 'John Doe') }
  let(:item) { create(:item, title: 'Tricycle') }

  let(:crazy_todo) { create(:todo, title: 'Crazy Bucket List', owner: 'Jane Doe') }
  let(:crazy_item) { create(:item, title: 'Cage Dive With Sharks') }

  before do
    todo.items << item
    crazy_todo.items << crazy_item
  end

  let(:headers) { { 'Content-Type' => 'application/vnd.api+json' } }

  describe 'GET /items' do
    it 'works! (now write some real specs)' do
      get todo_items_path(todo), params: {}, headers: headers
      expect(response).to have_http_status(200)
      expect(json_ids(false)).to match_array([item.id, crazy_item.id])
    end

    it 'works! (now write some real specs)' do
      get todo_items_path(todo), params: { 'filter[todo_id]': todo.id.to_s }, headers: headers
      expect(response).to have_http_status(200)
      expect(json_ids(false)).to match_array([item.id])
    end
  end

  describe 'SHOW /items' do
    it 'works! (now write some real specs)' do
      get todo_items_path(todo, item), params: {}, headers: headers
      expect(response).to have_http_status(200)
    end
  end
end
