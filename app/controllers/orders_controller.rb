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
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    Stripe::Charge.create(
      customer: customer.id,
      amount: @current_cart.tot.to_i * 100,
      description: "My money",
      currency: 'usd'
    )
    @order = current_user.orders.create(order_params)
    UserMailer.recap_order(@order.user.email, @order).deliver_later
    redirect_to users_order_path(@order), notice: "Order saved!"
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect to new_users_order_path
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
