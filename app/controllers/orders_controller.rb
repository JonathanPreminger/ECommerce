# frozen_string_literal: true

class OrdersController < ApplicationController
  after_action :update_cart_items, only: [:create]

  def new
    @order = Order.new
  end

  def index
    @orders = current_user.orders.newest_first
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new
    @order = current_user.orders.create(order_params)
    UserMailer.recap_order(@order.user.email, @order).deliver_later
    redirect_to users_order_path(@order), notice: "Order saved!"
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :delivery_address, :billing_address, :total)
  end

  def update_cart_items
    @current_cart.cart_items.each do |item|
      item.line_item_type = "Order"
      item.line_item_id = current_user.orders.last.id
      item.save
    end
  end
end
