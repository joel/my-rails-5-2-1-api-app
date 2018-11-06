require 'rails_helper'

RSpec.describe "Items", type: :request do
  let(:todo) { item.todo }
  let(:item) { build(:item) }
  
  describe "GET /items" do
    it "works! (now write some real specs)" do
      get todo_items_path(todo)
      expect(response).to have_http_status(200)
    end
  end
  
  describe "SHOW /items" do
    it "works! (now write some real specs)" do
      get todo_items_path(todo, item)
      expect(response).to have_http_status(200)
    end
  end
end
