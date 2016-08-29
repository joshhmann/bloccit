require 'rails_helper'
include RandomData

RSpec.describe AdvertisementsController, type: :controller do
  
  let(:my_advertisement) {Advertisement.create!(id: 1, title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 100) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_advertisement.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 100}
      expect(response).to redirect_to Advertisement.last
    end
  end
end
