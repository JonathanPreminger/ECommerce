# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CartItemsController, type: :controller do
  describe "DELETE #destroy" do
    let(:cart_item) { create(:cart_item, :for_cart) }

    context "with valid params" do
      it "destroys selected cart_item" do
        cart_item.reload
        expect {
          delete :destroy, params: { id: cart_item.id }, format: :js
        }.to change(CartItem, :count).by(-1)
      end
      it "raises flash messages" do
        delete :destroy, params: { id: cart_item.id }, format: :js
        expect(flash[:alert]).to eq("Oh, that's sad")
      end
      it "displays http success response" do
        delete :destroy, params: { id: cart_item.id }, format: :js
        expect(response).to be_successful
      end
      it "renders js destroy template" do
        delete :destroy, params: { id: cart_item.id }, format: :js
        expect(response).to render_template(:destroy)
      end
      it "displays text/js headers" do
        delete :destroy, params: { id: cart_item.id }, format: :js
        expect(response.headers["Content-Type"]).to eq "text/javascript; charset=utf-8"
      end
    end

    context "with unvalid params" do
      it "raises active record error" do
        expect {
          delete :destroy, params: { id: "unknown" }, format: :js
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "DELETE #reduce_quantity" do
    let(:cart_item) { create(:cart_item, :for_cart) }

    context "with unvalid params" do
      it "raises flash messages" do
        delete :reduce_quantity, params: { id: cart_item.id }, format: :js
        expect(flash[:alert]).to eq("Oh, that's sad")
      end
      it "displays http success response" do
        delete :reduce_quantity, params: { id: cart_item.id }, format: :js
        expect(response).to be_successful
      end
      it "renders js destroy template" do
        delete :reduce_quantity, params: { id: cart_item.id }, format: :js
        expect(response).to render_template(:reduce_quantity)
      end
      it "displays text/js headers" do
        delete :reduce_quantity, params: { id: cart_item.id }, format: :js
        expect(response.headers["Content-Type"]).to eq "text/javascript; charset=utf-8"
      end
    end

    context "with unvalid params" do
      it "raises active record error" do
        expect {
          delete :reduce_quantity, params: { id: "unknown" }, format: :js
        }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
