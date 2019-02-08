# frozen_string_literal: true

class CartItemsController < ApplicationController
  include CurrentCart
  before_action :find_cart_items, only: %i[add_quantity destroy reduce_quantity]
  before_action :find_items, only: :create
  respond_to :js

  def create
    if @current_cart.cart_items.find_by(item_id: @chosen_item, size_id: @chosen_size).nil?
      @cart_item = CartItem.create!(line_item_id: @current_cart.id, line_item_type: "Cart", item_id: @chosen_item.id, size_id: @chosen_size.id)
    else
      @cart_item = @current_cart.cart_items.find_by(item_id: @chosen_item.id, size_id: @chosen_size)
      @cart_item.update!(quantity: @cart_item.quantity + 1)
    end
    flash[:notice] = "I like your style"
  end

  def destroy
    @cart_item = @chosen_cart_item
    @cart_item.destroy
    flash[:alert] = "Oh, that's sad"
  end

  def add_quantity
    @cart_item = @chosen_cart_item
    @cart_item.update!(quantity: @cart_item.quantity += 1)
    flash[:notice] = "I like your style"
  end

  def reduce_quantity
    @cart_item = @chosen_cart_item
    @cart_item.update!(quantity: @cart_item.quantity -= 1) if @cart_item.quantity > 1
    flash[:alert] = "Oh, that's sad"
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id, :size_ids)
    permited
  end

  def find_cart_items
    @chosen_cart_item = CartItem.find(params[:id])
  end

  def find_items
    @chosen_item = Item.find(params[:item_id])
    @chosen_size = Size.find(params[:item][:size_ids])
  end
end
