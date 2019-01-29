# frozen_string_literal: true

class CartsController < ApplicationController
  include CurrentCart
  include CartTotal
  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    respond_to do |format|
      format.js { flash[:notice] = "Votre panier a bien été vidé" }
    end
  end
end
