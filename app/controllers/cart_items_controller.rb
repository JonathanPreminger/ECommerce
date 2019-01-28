# frozen_string_literal: true

class CartItemsController < ApplicationController
  respond_to :js, :html

  def create
    if @current_cart.cart_items.include?(@chosen_cart_item)
      @cart_item = @chosen_cart_item
      @cart_item.update!(quantity: @cart_item.quantity + 1)
    else
      @cart_item = CartItem.create!(cart_id: @current_cart.id, item_id: @chosen_item.id, size_id: @chosen_size.id)
    end
  end

  def destroy
    @cart_item = @chosen_cart_item
    @cart_item.destroy
    falsh[:notice] = "L'article a été supprimé du panier"
  end

  def add_quantity
    @cart_item = @chosen_item
    @cart_item.update!(quantity: @cart_item.quantity += 1)
    flash[:notice] = "+1 article dans votre panier"
  end

  def reduce_quantity
    @cart_item = @chosen_item
    @cart_item.update!(quantity: @cart_item.quantity += 1) if @cart_item.quantity > 1
    flash[:notice] = "-1 article dans vore panier"
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id, :size_id)
  end

  def find_cart_items
    @chosen_item = Item.find(params[:item_id])
    @chosen_size = Size.find(params[:size_id])
    @chosen_cart_item = CartItem.find(params[:id])
  end
end
