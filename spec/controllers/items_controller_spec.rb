# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET #index" do
    it "responds with success" do
      get :index
      expect(response).to be_success
    end
    it "renders the index view" do
      get :index
      expect(response).to render_template(:index)
    end
    it "populates an array of items" do
      item = create(:item_test)
      get :index
      expect(assigns(:items)).to eq([item])
    end
    it "populates an array of categories" do
      category = create(:category)
      get :index
      expect(assigns(:categories)).to eq([category])
    end
    it "populates an array of brands" do
      brand = create(:brand)
      get :index
      expect(assigns(:brands)).to eq([brand])
    end
  end

  describe "GET #show" do
    let(:item) { create(:item) }

    context "with valid attributes" do
      it "responds with success" do
        get :show, params: { id: item.id }
        expect(response).to be_success
      end
      it "responds renders the show view" do
        get :show, params: { id: item.id }
        expect(response).to render_template(:show)
      end
      it "assignthes selected item" do
        get :show, params: { id: item.id }
        expect(assigns(:item)).to eq(item)
      end
      it "displays text/html headers" do
        get :show, params: { id: item.id }
        expect(response.headers["Content-Type"]).to eq "text/html; charset=utf-8"
      end
    end

    context "with unvalid attributes" do
      it "respsponds with error" do
        expect {
          get :show, params: { id: "unknown" }
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
