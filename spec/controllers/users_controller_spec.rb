require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns users" do
      5.times do |i|
        User.create(name: "name-#{i}")
      end

      get :index

      json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end
  end
end
