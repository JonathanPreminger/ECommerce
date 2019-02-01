# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_order
  end

  def create
    @order = Order.new
    puts '%%%%%%%%%%%%'
    @order = current_user.orders.create(order_params)
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :delivery_address, :billing_address, :total)
  end

  def current_order
    Order.find(params[:id])
  end
end
