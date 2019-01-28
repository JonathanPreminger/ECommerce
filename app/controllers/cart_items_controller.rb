# frozen_string_literal: true

class CartItemsController < ApplicationController
  include CurrentCart
  before_action :find_cart_items
  respond_to :js

  def create
    if @current_cart.cart_items.include?(@chosen_cart_item)
      @cart_item = @chosen_cart_item
      @cart_item.update!(quantity: @cart_item.quantity + 1)
    else
      @cart_item = CartItem.create!(cart_id: @current_cart.id, item_id: @chosen_item.id, size_id: @chosen_size.id)
    end
    flash[:notice] = "Article ajouté au panier"
  end

  def destroy
    @cart_item = @chosen_cart_item
    @cart_item.destroy
    flash[:notice] = "Le panier est vide"
  end

  def add_quantity
    @cart_item = @chosen_cart_item
    @cart_item.update!(quantity: @cart_item.quantity += 1)
    format.js { flash[:notice] = "Article ajouté au panier" }
  end

  def reduce_quantity
    @cart_item = @chosen_cart_item
    @cart_item.update!(quantity: @cart_item.quantity -= 1) if @cart_item.quantity > 1
    flash[:notice] = "Article supprimé du panier"
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id, :size_id)
  end

  def find_cart_items
    @chosen_cart_item = CartItem.find(params[:id])
    @chosen_item = @chosen_cart_item.item_id
    @chosen_size = @chosen_cart_item.size_id
  end
end
