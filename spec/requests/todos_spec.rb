require 'rails_helper'

RSpec.describe "Todos", type: :request do
  let(:todo) { item.todo }
  let(:item) { build(:item) }
  
  describe "GET /todos" do
    it "works! (now write some real specs)" do
      get todos_path
      expect(response).to have_http_status(200)
    end
  end
  
  describe "SHOW /todos" do
    it "works! (now write some real specs)" do
      get todos_path(todo)
      expect(response).to have_http_status(200)
    end
  end
end
