# frozen_string_literal: true

module CurrentCart
  extend ActiveSupport::Concern
  included do
    before_action :check_cart
  end

  protected

  def check_cart
    return unless user_signed_in?

    if session[:cart_id]
      @current_cart = Cart.find(session[:cart_id])
    else
      @current_cart = Cart.create!(user_id: current_user.id, total: 0)
      session[:cart_id] = @current_cart.id
    end
  end
end
