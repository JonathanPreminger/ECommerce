# frozen_string_literal: true

class PopupCartsController < ApplicationController
  before_action :find_cart_items
  respond_to :js

  def destroy
    @cart_item = @chosen_cart_item
    @cart_item.destroy
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id, :size_id)
  end

  def find_cart_items
    @chosen_cart_item = CartItem.find(params[:id])
  end
end
