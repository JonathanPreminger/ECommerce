# frozen_string_literal: true

class CartItemsController < ApplicationController
  include CurrentCart
  before_action :find_cart_items, only: %i[add_quantity destroy reduce_quantity create]
  before_action :find_items, only: %i[create update]
  respond_to :js

  def create
    stock = Stock.find_by(item_id: @chosen_cart_item.item.id, size_id: @chosen_cart_item.size.id)
    if @current_cart.cart_items.find_by(item_id: @chosen_item, size_id: @chosen_size).nil? && stock.quantity.positive?
      @cart_item = CartItem.create!(line_item_id: @current_cart.id, line_item_type: "Cart", item_id: @chosen_item.id, size_id: @chosen_size.id)
      flash[:notice] = "Article ajouté au panier "
    elsif stock.quantity.positive?
      @cart_item = @current_cart.cart_items.find_by(item_id: @chosen_item.id, size_id: @chosen_size)
      @cart_item.update!(quantity: @cart_item.quantity + 1)
      flash[:notice] = "Article ajouté au panier "
    else
      flash[:alert] = "cet article n'est plus disponible"
    end
    puts stock.quantity
  end

  def destroy
    @cart_item = @chosen_cart_item
    @cart_item.destroy
    flash[:alert] = "Article retiré du panier"
  end

  def update; end

  def add_quantity
    stock = Stock.find_by(item_id: @chosen_cart_item.item.id, size_id: @chosen_cart_item.size.id)
    if stock.quantity.positive?
      @cart_item = @chosen_cart_item
      @cart_item.update!(quantity: @cart_item.quantity += 1)
      flash[:notice] = "1 article ajouté au panier"
      stock.update!(quantity: stock.quantity -= 1)
    else
      flash[:alert] = "cet article n'est plus disponible"
    end
    puts "________________________________________________________"
    puts stock.quantity
  end

  def reduce_quantity
    @cart_item = @chosen_cart_item
    @cart_item.update!(quantity: @cart_item.quantity -= 1) if @cart_item.quantity > 1
    flash[:notice] = "1 article supprimé du panier"
    stock = Stock.find_by(item_id: @chosen_cart_item.item.id, size_id: @chosen_cart_item.size.id)
    stock.update!(quantity: stock.quantity += 1)
    puts "________________________________________________________"
    puts stock.quantity
  end

  protected

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :cart_id, :size_ids)
  end

  def find_cart_items
    @chosen_cart_item = CartItem.find(params[:id])
  end

  def find_items
    @chosen_item = Item.find(params[:item_id])
    @chosen_size = Size.find(params[:item][:size_ids])
  end
end
